# WotReplayParser

Simple gem with an executable to parse metadata from World of Tanks replays and extract them
with the later goal to visualize them.

**Current functionality: parse directory & output as csv via rake task**

future steps may include:
* various output formats like xml, json, csv, ...
* database backend to keep own database to be independent on actual replays saved
* web frontend with direct visualization
* webservice for multiple users

## Installation

Add this line to your application's Gemfile:

    gem 'wot_replay_parser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wot_replay_parser

## Usage

`rake run[<path-to-wot-replays-folder>,<output-csv-file-path>]`

## Contributing

1. Fork it ( https://github.com/[my-github-username]/wot_replay_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
