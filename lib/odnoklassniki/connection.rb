require 'faraday'
require 'faraday_middleware'

module Odnoklassniki
  module Connection
    API_HOST = 'https://api.ok.ru'.freeze

    def connection(options={})
      options = options.clone

      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => "odnoklassniki ruby gem/#{Odnoklassniki::VERSION}"
        },
        :url => "#{API_HOST}/"
      }

      client = Faraday.default_adapter

      Faraday.new(default_options.merge(options)) do |conn|
        conn.request :multipart
        conn.request :url_encoded
        conn.adapter client
      end
    end

  end
end
