### Hello there! This gem is a placeholder and will be updated and working soon. Please do not install it yet.

# Fathom API

### 🛠 An easy to use client with the Fathom API

You'll need a usefathom.com account to use the API, if you don't have one [click here to sign up](https://usefathom.com/ref/CVNWHD).

As of August 17th, 2021 the API was still early-access, so some endpoints may be different than in production. Feel free to submit a PR or issue. Contributions are welcome!

[![Build Status](https://github.com/afomera/fathom_api/workflows/Tests/badge.svg)](https://github.com/afomera/fathom_api/actions) [![Gem Version](https://badge.fury.io/rb/fathom_api.svg)](https://badge.fury.io/rb/fathom_api)

## Installation

Add `fathom_api` to your application's Gemfile:

```bash
bundle add fathom_api

# OR in the Gemfile
gem "fathom_api"
```

## Usage

Create a client to get started, passing an `api_key` you generate in your Fathom API settings.

```ruby
client = Fathom::Client.new(api_key: ENV['FATHOM_API_KEY'])
```

### Fetch account details

```ruby
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

### Sites

```ruby
client.sites.list

# Optionally, pass params in to filter / limit responses
# Limit can be between 1 and 100
client.sites.list(limit: 1, starting_after: "SITE_ID")

client.sites.retrieve(site_id: site_id)
client.sites.create(site_id: site_id)
client.sites.delete(site_id: site_id)
client.sites.wipe(site_id: site_id)
```

### Events

```ruby
client.events.list(site_id: site_id)
# Optionally, pass params in to filter / limit responses
# Limit can be between 1 and 100
client.events.list(site_id: site_id, limit: 10, starting_after: "EVENT_ID")

client.events.retrieve(site_id: site_id, event_id: event_id)
client.events.create(site_id: site_id, **params)
client.events.delete(site_id: site_id, event_id: event_id)
client.events.wipe(site_id: site_id, event_id: event_id)
```

## 🙏 Contributing

This project uses Standard for formatting Ruby code. Please make sure to run standardrb before submitting pull requests. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the FathomApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## 📝 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
