require 'omniauth'
require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Withings < OmniAuth::Strategies::OAuth

      option :name, "withings"

      option :client_options, {
          :site               => 'https://oauth.withings.com',
          :request_token_path => '/account/request_token',
          :access_token_path  => '/account/access_token',
          :authorize_path     => '/account/authorize'
      }

      uid do
        access_token.params['userid']
      end

      info do
        unless @info
          user = raw_info["body"]["users"][0]
          @info = {
            :id => user["id"],
            :firstname => user["firstname"],
            :lastname => user["lastname"],
            :shortname => user["shortname"],
            :gender => user["gender"] == 0 ? :male : :female,
            :birthdate => user["birthdate"] ? Time.at(user["birthdate"]) : nil
          }
        end
      end

      extra do
        { 
            :raw_info => raw_info
        }
      end

      def raw_info
        @raw_info ||= MultiJson.load user_json
      end

      def user_json
        consumer.request(:get, user_uri, access_token, { :scheme => :query_string }).body
      end

      def user_uri
        "http://wbsapi.withings.net/user?action=getbyuserid&userid=#{uid}"
      end
    end
  end
end
