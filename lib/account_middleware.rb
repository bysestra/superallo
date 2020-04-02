class AccountMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    _, account_slug, request_path = env.fetch('REQUEST_PATH', env['PATH_INFO']).split('/', 3)

    if account_slug =~ /^[a-z]{1,10}$/i && Account.where(slug: account_slug).exists?
      if account = Account.find_by(slug: account_slug.downcase)
        Current.account = account
      else
        return [302, { "Location" => "/" }, []]
      end

      env['SCRIPT_NAME']  = "/#{account_slug}"
      env['PATH_INFO']    = "/#{request_path}"
      env['REQUEST_PATH'] = "/#{request_path}"
      env['REQUEST_URI']  = "/#{request_path}"
    end

    @app.call(env)
  end
end
