#!/bin/bash

cp config/database.yml.example config/database.yml
bundle exec rake db:setup
bundle exec rake
