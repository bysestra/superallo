require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @contact = contacts(:one)
  end

  test "can get #index" do
    get contacts_url
    assert_response :success
  end

  test "#update stores `multiple` custom field values" do
    patch contact_url(@contact), params: { contact: { properties: { languages: %w( English French ) } } }
    assert_equal %w( English French ), @contact.reload.properties["languages"]
  end

  test "can get #show" do
    get contact_url @contact
    assert_response :success
  end

  test "can get #show with no surveys" do
    Survey.destroy_all
    get contact_url @contact
    assert_response :success
  end
end
