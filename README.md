# OmniAuth Withings Strategy

This gem is an OmniAuth 1.0+ Strategy for the [Withings API](http://www.withings.com/api).

## Usage

Add the strategy to your `Gemfile`:

```ruby
gem 'omniauth-withings'
```

Then integrate the strategy into your middleware:

```ruby
use OmniAuth::Builder do
  provider :withings, 'consumer_key', 'consumer_secret'
end
```

In Rails, create a new file under config/initializers called omniauth.rb to plug the strategy into your middleware stack.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :withings, 'consumer_key', 'consumer_secret'
end

```

## Example Application

There is an example Sinatra application in spec/integration_app.rb

## Withings API Credentials and other info

To register your application with Withings and obtain a consumer key and secret, go to the [Withings application registration](https://oauth.withings.com/en/partner/add).

For additional information about OmniAuth, visit [OmniAuth wiki](https://github.com/intridea/omniauth/wiki).

For a short tutorial on how to use OmniAuth in your Rails application, visit [this tutsplus.com tutorial](http://net.tutsplus.com/tutorials/ruby/how-to-use-omniauth-to-authenticate-your-users/).


## Copyright

Copyright (c) 2013 O.C. Tanner. See [LICENSE](https://github.com/octanner/omniauth-withings/blob/master/LICENSE.md) for details.
