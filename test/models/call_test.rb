require "test_helper"

class CallTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  setup do
    Current.account = accounts(:acme)
  end

  test "creating a call infers from and to numbers" do
    call = Call.create!(account: accounts(:acme), creator: users(:one), callee: contacts(:one))
    assert_equal call.from_number, users(:one).outgoing_call_number
    assert_equal call.to_number, contacts(:one).phone_number
  end

  test "incineration job scheduling" do
    assert_enqueued_with(job: Call::IncinerationJob, args: contacts(:one).calls.last) do
      contacts(:one).calls.create!(creator: users(:one))
    end
  end
end
