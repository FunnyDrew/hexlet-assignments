# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, _, body = @app.call(env)
    return [404, {}, ['404 Not Found']] if status == 404

    [200, {}, [body.first, Digest::SHA2.new(256).hexdigest(body.first).to_s]]
    # END
  end
end
