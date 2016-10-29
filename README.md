[![Gem Version](https://badge.fury.io/rb/gem-versioner.svg)](https://badge.fury.io/rb/gem-versioner)
[![Circle CI](https://circleci.com/gh/FundingCircle/gem-versioner/tree/master.svg?style=shield)](https://circleci.com/gh/FundingCircle/gem-versioner/tree/master)

# Gem::Versioner

A plugin for RubyGems which lets you pass in version strings via a environment variable.

## Installation

Install it yourself as:

    $ gem install gem-versioner

## Usage

when you build a gem e.g. `my-gem`
you can specify a pre release version by

    $ PRE_RELEASE=foo build my-gem.gemspec
    
This will build a gem with a version in the following format `${gem_version}.pre.${PRE_RELEASE}.${current_timestamp}` , for example: `0.0.1.pre.foo.20160919174006`

## Publishing
As soon as a new PR is merged to master CircleCI is responsible to publish the new version of the Gem to https://rubygems.org/

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/FundingCircle/gem-versioner. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

Copyright © 2016 Funding Circle Ltd.

Distributed under the BSD 3-Clause License.
