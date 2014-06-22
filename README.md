# WotReplayParser

Simple gem with an executable to parse metadata from World of Tanks replays and extract them
with the later goal to visualize them.

future steps may include:
* various output formats like xml, json, csv, ...
* database backend to keep own database to be independent on actual replays saved
* web frontend with direct visualization
* webservice for multiple users

## Installation

Add this line to your application's Gemfile:

    gem 'WotReplayParser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install WotReplayParser

## Usage

`ruby bin/wot_replay_parser -h`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/WotReplayParser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
