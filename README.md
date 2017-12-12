# Flickr Clone-ish
_An application allowing users to upload photos, like or dislike photos, and tag each other in them_

## Installation

* This application was built on Ruby 2.4.1 on Rails 5.1.4, using PostgreSQL as a database server. If you have these or equivalent versions installed, you're ready to install this repository:
  * If you need to install Ruby and/or Rails, I recommend a version manager. Apple users, don't use the pre-installed version of Ruby. Check out https://github.com/postmodern/chruby, great start-up documentation, and a great ruby version manager and installer. Use the instructions to install with Homebrew (https://brew.sh/).

  * These setup instructions assume the use of PostgreSQL as a SQL server (https://www.postgresql.org/). You can use any SQL server, such as mySQL, but these instructions only support Postgres, and I have not tested on other SQL servers.

* Clone this repository `$ git clone https://github.com/aaronrohrbacher/flickr`
* Navigate to the root directory of this project: `$ cd flickr`
* Install dependencies: `$ bundle install`
* Start your Postgres server: `$ postgres`
* In a new terminal window, Create and migrate the databases (pre-seeded and ready to go!): `$ rails db:setup`
* Open a new terminal tab, and serve the project in development mode: `$ rails s`
* Open your favorite web browser, point to http://localhost:3000/ (most common configuration), and have fun!

## Use

* I've seeded the database with one user.
  * User: user password: 111111

* Play around! Add new photos, create more accounts, search for your new imaginary account friends, tag their photos, explore!

## Technologies used

* Built in Ruby 2.4.1 on Rails 5.1.4
* Uses Postgres as SQL server
* Authentication with the Devise gem, customized for username login.
* Image upload capability uses the Paperclip gem.
