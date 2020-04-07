require 'test_helper'

class Call::IncinerationJobTest < ActiveJob::TestCase
  setup do
    Current.account = accounts(:acme)
    @call = contacts(:one).calls.create!(creator: users(:one))
  end

  test 'that call is destroyed' do
    travel 31.days do
      Call::IncinerationJob.perform_now(@call)
    end

    assert @call.destroyed?
  end
end
