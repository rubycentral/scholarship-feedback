# RailsConf Scholarship Feedback [![Build Status](https://travis-ci.org/rubycentral/scholarship-feedback.svg)](https://travis-ci.org/rubycentral/scholarship-feedback) [![Code Climate](https://codeclimate.com/github/rubycentral/scholarship-feedback.png)](https://codeclimate.com/github/rubycentral/scholarship-feedback)

A site for RailsConf 2014 Scholars and Guides to register and leave feedback about their experience.

## Setup

Install all the dependencies:

    $ bundle install

Set up the database:

    $ cp config/database.yml.example config/database.yml
    $ rake db:setup

Import the attendees:

    $ rake import:attendees

Run the Rails server:

    $ rails s

Then visit [http://localhost:3000](http://localhost:3000).

## Deployment

Set the `RAILS_MAILER_HOST` environment variable to get mails sending correctly.

## Contributing

1. Fork it ( https://github.com/minifast/guides/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
