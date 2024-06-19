class MyMiddle

	def initialize(app)
		@app = app
	end

	def call(env)
		status, headers, response = @app.call(env)

		Rails.logger.debug("#" * 50)
    Rails.logger.debug("#{status}")
    Rails.logger.debug("#" * 50)

		[status, headers, response]
	end

end
