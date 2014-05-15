# GoogleMapsAPI::DistanceMatrix

This is a wrapper around the Google Maps Distance Matrix API.

## Installation

Add this line to your application's Gemfile:

    gem 'google_maps_api-distance_matrix'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_maps_api-distance_matrix

## Usage

```ruby
GoogleMapsAPI::DistanceMatrix.calculate(origins, destinations, options = {})
```

Origins and destinations are arrays of strings or anything that supports ```to_ary```.
Options is a *Symbols* Hash with optional parameters. (See https://developers.google.com/maps/documentation/distancematrix/#RequestParameters for more information).

For Google Business/Enterprise requests, include the ```:key```, ```:client``` and optionally, ```:channel``` in the options hash.

### Examples:

```ruby
origins = ["350, 5th Ave, NY", "100, 56th St, NY", [40.764291, -73.979169], ...]
destinations = ["673, 45th St, NY", [40.763641,-73.987473], ...]
options = {:language => 'pt'}
GoogleMapsAPI::DistanceMatrix.calculate(origins, destinations, options)
# => #<GoogleMapsAPI::DistanceMatrix::Response:0x00000001f2b510...>
```

The ```GoogleMapsAPI::DistanceMatrix::Response``` object mimics the API JSON structure.

## Contributing

I am new to Ruby and Testing. We need better specs.

1. Fork it ( https://github.com/zavan/google_maps_api-distance_matrix/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

### Important

* Do not touch the version;
* Write specs for new features;
* Be independent of Rails stuff;
* All specs must pass.

## Also see

* [http://github.com/zavan/google_maps_api-core](http://github.com/zavan/google_maps_api-core)
* [http://github.com/zavan/google_maps_api-directions](http://github.com/zavan/google_maps_api-directions)
