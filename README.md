[![Code Climate](https://codeclimate.com/github/riverock/balihoo_lpc_client/badges/gpa.svg)](https://codeclimate.com/github/riverock/balihoo_lpc_client)
[![Test Coverage](https://codeclimate.com/github/riverock/balihoo_lpc_client/badges/coverage.svg)](https://codeclimate.com/github/riverock/balihoo_lpc_client/coverage)
[![Build Status](https://travis-ci.org/riverock/balihoo_lpc_client.svg?branch=develop)](https://travis-ci.org/riverock/balihoo_lpc_client)

# BalihooLpcClient

This provides a ruby wrapper around the Balihoo Local Partner Connect API.

**NOTE: It is still under development and all the available endpoints have not yet been
implemented.**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'balihoo_lpc_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install balihoo_lpc_client

## Usage

Using the gem is quite simple.

### Configuration

First we must create a Configuration object.

```ruby
opts = {
  brand_key: 'brand_key',
  api_key: 'api_key',
  location_key: 'location_key', # optional more below
  user_id: 'brand_key', # currently not used, Balihoo suggests setting same as brand_key
  group_id: 'brand_key' # currently not used, Balihoo suggests setting same as brand_key
}
config = BalihooLpcClient::Configuration.create(opts)
```

The `location_key` is an optional parameter. When not given the api will require
an array of locations to be passed to the api endpoints. This is explained
further below.

### Initialization

Once we have the config created we can use that to create an instance of the Api
object and authenticate with Balihoo.

```ruby
api = BalihooLpcClient::Api.new(config: config)
api.authenticate!
```

The `authenticate!` method will call out to Balihoo and set the `client_id` and
`client_api_key` on the config object for you.

```ruby
config.client_id # => <client_id from Balihoo>
config.client_api_key # => <client_api_key from Balihoo>
```

Once we have authenticated we can begin to call the various endpoints.

### Endpoints

#### Common Options

There are a set of common options that can be sent to an endpoint. These are
always sent as the params argument to an endpoint.

```ruby
api.campaigns(params: options)
```

The options are as follows:

- `from:` A start date to filter results, with the format `yyyy-mm-dd`
- `to:` An end date to filter results, with the format `yyyy-mm-dd`
- `locations:` An array of locations (Use location key). _*If location_key was
given during authentication this should not be used.*_
- `tactic_id:` Tactic id to filter results. Only supported with
`get_report_data` endpoint.

#### Campaigns

If you passed a `location_key` to the config then you can simply call
`campaigns` on the api object.

```ruby
api.campaigns # => Array[Response::Campaign]
```

If the `location_key` was not passed then you must pass an array of locations to
get campaigns for.

```ruby
# Single location requested
campaigns = api.campaigns(params: { locations: [1] })
campaigns # => Array[Response::Campaign]

# Multiple locations requested
campaigns = api.campaigns(params: { locations: [1,2] })
campaigns # => { "1" => Array[Response::Campaign], "2" => Array[Response::Campaign] }
```

#### Tactics

```ruby
tactics = api.tactics(campaign_id: 1)
tactics # => Array[BalihooLpcClient::Response::Tactic]

# Without location_key using locations: param
# Single location requested
tactics = api.tactics(campaign_id: 1, params: { locations: [1] })
tactics # => Array[BalihooLpcClient::Response::Tactic]

# Multiple locations requested
tactics = api.tactics(campaign_id: 1, params: { locations: [1,2] })
tactics # => { "1" => Array[Response::Tactic], "2" => Array[Response::Tactic] }
```

#### Campaigns with Tactics

```ruby
response = api.campaigns_with_tactics # => Array[BalihooLpcClient::Response::Campaign]
response.tactics # => Array[BalihooLpcClient::Response::Tactic]

# Without location_key using locations: param
# Single location requested
campaigns = api.campaigns_with_tactics(params: { locations: [1] })
campaigns # => Array[BalihooLpcClient::Response::Campaign]
campaigns.first.tactics # => Array[BalihooLpcClient::Response::Tactic]

# Multiple locations requested
campaigns = api.campaigns_with_tactics(params: { locations: [1,2] })
campaigns # => { "1" => Array[Response::Campaign], "2" => Array[Response::Campaign] }
```

#### Metrics

```ruby
metrics = api.metrics(tactic_id: 1)
metrics # => Response::Metric

# Without location_key using locations: param
# Single location requested
metrics = api.metrics(tactic_id: 1, params: { locations: [1] })
metrics # => Response::Metric

# Multiple locations requested
metrics = api.metrics(tactic_id: 1, params: { locations: [1,2] })
metrics # => {"1" => Response::Metric, "2" => Response::Metric}
```

#### Website Metrics

```ruby
website_metrics = api.website_metrics
website_metrics # => Response::WebsiteMetric

# Without location_key using locations: param
# Single location requested
website_metrics = api.website_metrics(params: { locations: [1] })
website_metrics # => Response::WebsiteMetric

# Multiple locations requested
website_metrics = api.website_metrics(params: { locations: [1,2] })
website_metrics # => {"1" => Response::WebsiteMetric, "2" => Response::WebsiteMetric}
```

### Response Objects

#### BalihooLpcClient::Response::Authentication

```ruby
auth.client_id # => String (GUID)
auth.client_api_key # => String (GUID)
```

#### BalihooLpcClient::Response::Campaign

```ruby
campaign.id # => Fixnum
campaign.title # => String
campaign.description # => String
campaign.start # => Date
campaign.end # => Date
campaign.status # => String
campaign.tactics # => Array[BalihooLpcClient::Response::Tactic]
```

_Note: `tactics` is only populated if `campaigns_with_tactics` is called._

#### BalihooLpcClient::Response::Tactic

```ruby
tactic.id # => Fixnum
tactic.title # => String
tactic.start # => Date
tactic.end # => Date
tactic.channel # => String
tactic.description # => String
tactic.creative # => String - this is a url
```

#### BalihooLpcClient::Response::Metric

```ruby
metric.tactic_ids # => Array[Int]
metric.channel # => String
metric.clicks # => Fixnum
metric.spend # Float
metric.impressions # => Fixnum
metric.ctr # Float
metric.avg_cpc # Float
metric.avg_cpm # Float
```

#### BalihooLpcClient::Response::WebsiteMetric

```ruby
website_metric.visits # => Response::WebsiteMetricVisits
website_metric.leads # => Response::WebsiteMetricLeads
```

#### BalihooLpcClient::Response::WebsiteMetricVisits

```ruby
visits.total # => Fixnum
visits.organic # => Fixnum
visits.direct # => Fixnum
visits.referral # => Fixnum
visits.paid # => Fixnum
visits.new_visits_percent # => Float
```

#### BalihooLpcClient::Response::WebsiteMetricLeads

```ruby
leads.total # => Fixnum
leads.total_web # => Fixnum
leads.total_phone # => Fixnum
leads.organic_web # => Fixnum
leads.paid_web # => Fixnum
leads.organic_phone # => Fixnum
leads.paid_phone # => Fixnum
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/riverock/balihoo_lpc. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
