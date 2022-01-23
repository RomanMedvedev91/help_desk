# help_desk

This app is for managing the tickets and their status assigned to the team.

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
