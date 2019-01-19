# README

This project requires:

* Ruby 2.5.0
* Rails 5.1.4
* Postgres

To run this project follow the steps bellow:

* Change the configuration on `config/database.yml` to access your database;
* Run `bundle install` to install all the required gems;
* Run `bundle exec rake db:setup` to create the database and do the migration;
* Run `bundle exec rails s` to start the server.