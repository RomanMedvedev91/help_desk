# help_desk

This app is for managing the tickets and their status assigned to the team.

- screenshoot #1

!["screenshoot#1 of scheduler project"]()

- screenshoot #2

!["screenshoot#2 of scheduler project"]()

- screenshoot #3

!["screenshoot#3 of scheduler project"]()

- screenshoot #4

!["screenshoot#4 of scheduler project"]()

To run the application, follow the following steps

1.  Create a database

        CREATE DATABASE helpdesk_development;

2.  run bundle install

        bundle install

3.  add the data to database

        rake db:migrate

4.  seed the database

        rake db:seed

5.  run the app

        bin/rails s -b 0.0.0.0

# tests

1.  Generate rspec

        bin/rails generate rspec:install

2.  Generate the binstub so you can run bin/rspec instead of bundle exec rspec from within the project directory:

        bundle binstubs rspec-core

3.  create the test pg database. Your development and test databases are separate so that you can run your tests in isolation and neither one affects the other

        bin/rake db:setup RAILS_ENV=test

# running test

        bin/rspec

# cron setup

1.  create a new log file inside log directory

        cron_log.log

2.  start the scheduler

        whenever –update-crontab –set environment=’development’

3.  stop the scheduler

        whenever -c

4.  see what in the crontab

        crontab -l

the config/scheduler.rb will run every 1 minute

# for the tigger

1. copy the text from trigger.sql
2. login to postgres to helpdesk_development
3. paste the whole text
4. check if any error You should see
5. time trigger created and 2 time function created
