$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'omniauth/strategies/withings'
require 'sinatra'

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :withings, ENV['WITHINGS_KEY'], ENV['WITHINGS_SECRET']
end

get '/' do
  <<-HTML
  <h1>Withings OmniAuth Test App</h1>
  <a href='/auth/withings'>Sing in with Withings</a>
  HTML
end

get '/auth/:name/callback' do
  "Done"
end

