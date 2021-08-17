### Hello there! This gem is a placeholder and will be updated and working soon. Please do not install it yet.

# Fathom API

### 🛠 An easy to use client with the Fathom API

[![Build Status](https://github.com/afomera/fathom_api/workflows/Tests/badge.svg)](https://github.com/afomera/fathom_api/actions) [![Gem Version](https://badge.fury.io/rb/fathom_api.svg)](https://badge.fury.io/rb/fathom_api)

## Installation

Add `fathom_api` to your application's Gemfile:

```bash
bundle add fathom_api

# OR in the Gemfile
gem "fathom_api"
```

## Usage

```ruby
client = Fathom::Client.new(api_key: ENV['FATHOM_API_KEY'])

# Get account details
client.account.info
# => Fathom::Account
```

Responses are wrapped in an object that dynamically allows you to call the attributes as if they are an OpenStruct... IE

```ruby
response = client.account.info
# => #<Fathom::Account:0x00007fee844068c8 @attributes=#<OpenStruct id=12345, name="Your account name", email="you@starfleet.org", object="account">>

response.name
# => "Your account name"
response.email
# => "you@starfleet.org"
```

## 🙏 Contributing

This project uses Standard for formatting Ruby code. Please make sure to run standardrb before submitting pull requests. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the FathomApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## 📝 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
