# twitterwatch
twitterwatch is a data analysis and OSINT framework for Twitter. twitterwatch supports creating multiple workspaces where arbitrary Twitter users can be added and their Tweets harvested through the Twitter API for offline storage and analysis.

[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)

## Installation

### 1. Ruby

twitterwatch is written in [Ruby](https://www.ruby-lang.org/) and requires at least version 1.9.3 or above. To check which version of Ruby you have installed, simply run `ruby --version` in a terminal.

Should you have an older version installed, it is very easy to upgrade and manage different versions with the Ruby Version Manager ([RVM](https://rvm.io/)). Please see the [RVM website](https://rvm.io/) for installation instructions.

### 2. RubyGems

twitterwatch is packaged as a Ruby gem to make it easy to install and update. To install Ruby gems you'll need the RubyGems tool installed. To check if you have it already, type `gem` in a Terminal. If you got it already, it is recommended to do a quick `gem update --system` to make sure you have the latest and greatest version. In case you don't have it installed, download it from [here](https://rubygems.org/pages/download) and follow the simple installation instructions.

### 3. PostgreSQL

twitterwatch uses a PostgreSQL database to store all its data. If you are setting up twitterwatch in the [Kali](https://www.kali.org/) linux distribution you already have it installed, you just need to make sure it's running by executing `service postgresql start` and perhaps install a dependency with `apt-get install libpq-dev` in a terminal. Here's an excellent [guide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-9-4-on-debian-8) on how to install PostgreSQL on a Debian based Linux system. If you are setting up twitterwatch on a Mac, the easiest way to install PostgreSQL is with [Homebrew](http://brew.sh/). Here's a [guide](http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/) on how to install PostgreSQL with Homebrew.

#### 3.1 PostgreSQL user and database

You need to set up a user and a database in PostgreSQL for twitterwatch. Execute the following commands in a terminal:

    sudo su postgres # Not necessary on Mac OS X
    createuser -s twitterwatch --pwprompt
    createdb -O twitterwatch twitterwatch

You now have a new PostgreSQL user with the name `twitterwatch` and with the password you typed into the prompt. You also created a database with the name `twitterwatch` which is owned by the `twitterwatch` user.

### 4. Graphviz

Some twitterwatch modules use [Graphviz](http://graphviz.org/) to generate visual graphs and other things. On a Mac you can install Graphviz with [homebrew](http://brew.sh/) by typing `brew update && brew install graphviz` in a terminal. On a Debian based Linux distro, Graphviz can be installed by typing `sudo apt-get update && sudo apt-get install graphviz` in a terminal.

### 5. ImageMagick

Some twitterwatch modules use [ImageMagick](https://imagemagick.org/script/index.php) to generate images. On a Mac you can install Imagemagick with [homebrew](http://brew.sh/) by typing `brew update && brew install imagemagick` in a terminal. On a Debian based Linux distro, ImageMagick can be installed by typing `sudo apt-get update && sudo apt-get install libmagickwand-dev imagemagick` in a terminal.
