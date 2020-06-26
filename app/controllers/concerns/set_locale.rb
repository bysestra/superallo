module SetLocale
  extend ActiveSupport::Concern
  
  included do
    before_action do
      locale = params.fetch(:locale, Current.account&.locale).to_s.strip.to_sym
      I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
