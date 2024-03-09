# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    path = request.path
    return [403, {}, []] if path.start_with?('/admin')

    [status, headers, body]
    # END
  end
end
