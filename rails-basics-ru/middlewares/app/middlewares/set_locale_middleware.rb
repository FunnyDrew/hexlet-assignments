# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @status, @headers, @response = @app.call(env)

    #debugger


    #debugger

    locale = get_locale_from_header(env) || I18n.default_locale


    I18n.locale = locale

    s2, h2, r2 = @app.call(env)


    [s2, h2, r2]
  end

  private
  def get_locale_from_header(env)
    accept_languages = Rack::Request.new(env).get_header('HTTP_ACCEPT_LANGUAGE')
    accept_languages.nil? ? nil : accept_languages.scan(/^[a-z]{2}/).first
  end

  # END
end
