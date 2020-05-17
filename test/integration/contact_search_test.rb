require "test_helper"

class ContactSearchTest < ActionDispatch::IntegrationTest
  setup do
    Searchkick.enable_callbacks
    prepopulate_search_data
    sign_in users(:one)
  end

  teardown do
    Searchkick.disable_callbacks
  end

  test "search by name" do
    get "/contacts", params: { q: "adam" }
    assert_select "tr.contact", count: 1
    assert_select "h2", "Adam Smith"
  end

  test "search by phone number" do
    get "/contacts", params: { q: "15437284939" }
    assert_select "tr.contact", count: 1
    assert_select "h2", "David Ben Gurion"
  end

  test "search by arbitrary properties" do
    get "/contacts", params: { q: "Poland" }
    assert_select "tr.contact", count: 1
    assert_select "h2", "David Ben Gurion"

    get "/contacts", params: { q: "Scotland" }
    assert_select "tr.contact", count: 1
    assert_select "h2", "Adam Smith"
  end

  private

  def prepopulate_search_data
    Contact.create(name: "Adam Smith", phone_number: "+420123123608", account: accounts(:acme), properties: { origin: "Scotland" })
    Contact.create(name: "David Ben Gurion", phone_number: "+15437284939", account: accounts(:acme), properties: { origin: "Poland" })
    Contact.search_index.refresh
  end
end
