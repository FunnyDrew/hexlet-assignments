# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start_time = Time.now

    status, headers, body = @app.call(env)

    end_time = (Time.now - start_time) * 1000
    # puts ("#{'%.2f' % end_time}ms")
    puts "#{format('%2f', end_time)} ms"

    [status, headers, body]
    # END
  end
end
