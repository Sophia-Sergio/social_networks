# README

App for fetching social networks data.

## Technical description

App without database and views (API mode). Created with command `rails new social_network --api --skip-active-record --skip-test`. Last `--skip-test` option is included because I want to use rspec instead of minitest.

## What you need

`ruby 3.1.0`
`rails 7.0.1`

## Start program

`bundle install`
`rails s`

## Fetch the social networks data

`curl localhost:3000`

## Testing

`rspec spec/controllers/application_controller_spec.rb`
