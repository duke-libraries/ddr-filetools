# Ddr::Extraction

Pluggable text and metadata extraction service.

[![Gem Version](https://badge.fury.io/rb/ddr-extraction.svg)](http://badge.fury.io/rb/ddr-extraction)
[![Build Status](https://travis-ci.org/duke-libraries/ddr-extraction.svg?branch=develop)](https://travis-ci.org/duke-libraries/ddr-extraction)
[![Coverage Status](https://coveralls.io/repos/duke-libraries/ddr-extraction/badge.png?branch=develop)](https://coveralls.io/r/duke-libraries/ddr-extraction?branch=develop)
[![Code Climate](https://codeclimate.com/github/duke-libraries/ddr-extraction/badges/gpa.svg)](https://codeclimate.com/github/duke-libraries/ddr-extraction)

## Installation

Add this line to your application's Gemfile:

    gem 'ddr-extraction'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ddr-extraction

## Dependencies

The gem has no external dependencies of its own. Consult the documentation for each extraction tool used by your configuration.

## Configuration

`Ddr::Extraction` includes default configurations for [Apache Tika](http://tika.apache.org/) (text and metadata extraction) and [FITS](http://fitstool.org/) (metadata only).  Tika is set as the default adapter when one is not specified to the builder.

```ruby
require "ddr-extraction
Ddr::Extraction.load_defaults!
```

There are rake tasks for downloading Tika and FITS to expected locations.

```sh
rake tika:download
rake fits:download
```

Configuration Example

```ruby
Ddr::Extraction.configure do |config|
  config.adapters.default = :tika # Use Tika as the default adapter
  config.adapters.tika.path = "/path/to/tika-app.jar"
  config.adapters.fits.path = "/path/to/fits.sh"
end
```

## Usage

```
>> extractor = Ddr::Extraction.build_extractor
>> text = extractor.extract(:text, "spec/fixtures/sample.docx")
>> puts text.read
This is a sample document.
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ddr_extractor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
