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

### A note on Fathom::List objects

When an API's response comes back with a object of "list", we automatically wrap that to attempt to provide some helper methods to ease your implementations.

```ruby
list = client.sites.list
# => Fathom::List

# get the cursor you can pass to the next request's starting_after param
list.next_page
# or get the ending_before param's cursor
list.prev_page

# check if the list has more after it with
list.has_more?
```

### Sites

```ruby
client.sites.list
# Optionally, pass params in to filter / limit responses
# Limit can be between 1 and 100
client.sites.list(limit: 1, starting_after: "SITE_ID")
# => Fathom::List

client.sites.retrieve(site_id: site_id)
client.sites.create({}) # Include `name` and other params
client.sites.update(site_id: site_id, {}) # Params being updated
client.sites.delete(site_id: site_id)
client.sites.wipe(site_id: site_id)
# All return
# => Fathom::Site
```

### Events

```ruby
client.events.list(site_id: site_id)
# => Fathom::List
# Optionally, pass params in to filter / limit responses
# Limit can be between 1 and 100
client.events.list(site_id: site_id, limit: 10, starting_after: "EVENT_ID")
# => Fathom::List

client.events.retrieve(site_id: site_id, event_id: event_id)
client.events.create(site_id: site_id, {}) # Attributes for event
client.events.update(site_id: site_id, {}) # Attributes being updated
client.events.delete(site_id: site_id, event_id: event_id)
client.events.wipe(site_id: site_id, event_id: event_id)
# All return
# Fathom::Event
```

### Current Visitors

```ruby
client.current_visitors(site_id: site_id, {}) # Can add detailed: true for a more detailed report
```

### Aggregation

```ruby
client.aggregations.list(entity_id: entity_id, entity_type: entity_type, aggregates: aggregates, **params)
```

## 🙏 Contributing

This project uses Standard for formatting Ruby code. Please make sure to run standardrb before submitting pull requests. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the FathomApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/afomera/fathom_api/blob/main/CODE_OF_CONDUCT.md).

## 📝 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
