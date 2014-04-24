# RailsConf Guides [![Build Status](https://travis-ci.org/minifast/guides.svg)](https://travis-ci.org/minifast/guides) [![Code Climate](https://codeclimate.com/github/minifast/guides.png)](https://codeclimate.com/github/minifast/guides)

A site for RailsConf 2014 Scholars and Guides.

## Setup

Install all the dependencies:

    $ bundle install

Set up the database:

    $ cp config/database.yml.example config/database.yml
    $ rake db:setup

Run the Rails server:

    $ rails s

Then visit [http://localhost:3000](http://localhost:3000).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/matching-machine/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
