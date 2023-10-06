module Middleware
  class VerifyToken
    def initialize(app)
      @app = app
    end
  
    def call(env)
      request = ActionDispatch::Request.new(env)
      if request.headers['token'] != 'my-secret-token' && request.original_fullpath == "/graphql" && request.request_method == 'POST'
        return [200, {}, ['invalid or missing token']]
      end
  
      @app.call(env)
    end
  end
end