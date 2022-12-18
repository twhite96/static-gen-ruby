# Installing the project

!!!danger "BEWARE!"
    These docs are in the very early stages of being worked on. Nothing is finished int he project yet, but I wanted to get my thoughts out about it here in the docs for me to reference later.


- Clone the repo from GitHub using: `git clone https://github.com/twhite96/static-gen-ruby`
- `cd` into the directory you just created, `static-gen-ruby`
- Open up your terminal and run `gem install static-gen`
- The CLI will then install all the necessary gems as dependencies to the project.

## Additional gems

You would need to add your gems to a `Gemfile`, no extension, like so:


```rb
source 'https://rubygems.org'

gem 'rails', '5.0.0'
gem 'rack-cache', require: 'rack/cache'
gem 'nokogiri', '~> 1.4.2'
```

This snippet is just an example, **PLEASE DON'T COPY, PASTE, AND USE IN THIS PROJECT!** This is just sample code to illustrate how to write to a `Gemfile`.

Open your terminal again. Make sure you have Bundler installed, which you can install either from Homebrew or with this command:

`gem install bundler --user-install`

This command isn't necessary if Ruby 3 is already installed on your system as Ruby 3 installs `bundler` for you.

Once you have `bundler` installed and all the dependencies in the `Gemfile`, all you need to run is `bundle` and all the extra dependencies are installed for you. Easy peasy.

