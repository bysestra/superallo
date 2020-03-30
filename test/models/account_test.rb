require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'middleware' do
    account = accounts(:acme)
    path = "/#{account.id}/clients"

    middleware = AccountMiddleware.new(->(env) { [200, env, 'app'] })
    response = Rack::MockRequest.new(middleware).get(path, 'REQUEST_PATH' => path)

    assert_equal Current.account, account
  end
end
