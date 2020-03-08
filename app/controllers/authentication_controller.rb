# frozen_string_literal: true

# This class handles application authentication.
class AuthenticationController < ApplicationController
  post '/unauthenticated' do
    content_type :json
    status 401
    json(message: 'Sorry, this request can not be authenticated. Try again.')
  end

  use Warden::Manager do |config|
    config.scope_defaults :default,
                          strategies: [:access_token],
                          action: '/unauthenticated'
    config.failure_app = self
  end

  Warden::Manager.before_failure do |env, opts|
    logger.error("Authentication failed to `#{opts[:attempted_path]}`\nReason: #{opts[:message]}")
    env['REQUEST_METHOD'] = 'POST'
  end

  Warden::Strategies.add(:access_token) do
    def valid?
      # Validate that the access token is properly formatted.
      # Currently only checks that it's actually a string.
      request.env['HTTP_ACCESS_TOKEN'].is_a?(String)
    end

    def authenticate!
      access_granted = request.env['HTTP_ACCESS_TOKEN'] == AuthToken.first.token

      !access_granted ? fail!('Invalid authentication token!') : success!(access_granted)
    rescue NoMethodError
      fail!('No token created! Please create a token with `rake db:generate_token` or set protected to `false` in the config.')
    end
  end

  Warden::Strategies.add(:basic) do
    def valid?
      APP_CONFIG.user.is_a?(String)
      APP_CONFIG.pass.is_a?(String)
    end

    def authenticate!
      hash = request.env['HTTP_AUTHORIZATION'].split(' ')[1]
      decoded_auth = Base64.decode64(hash).split(':')
      umatch = decoded_auth[0] == APP_CONFIG.user
      pmatch = decoded_auth[1] == APP_CONFIG.pass

      access_granted = umatch == pmatch

      !access_granted ? fail!('Invalid Username or Password!') : success!(access_granted)
    rescue NoMethodError
      fail!('No authentication passed! Authentication required.')
    end
  end
end
