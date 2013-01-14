SpreeTolk
=========

Edit your translations through the [Spree](http://github.com/spree/spree) Admin Area. 

This is a fork of [Tolk](http://github.com/tolk/tolk) 1.3.4 as a Spree 1.2 extension. 

Installation
=======

Add the following to your Gemfile

    gem 'spree_tolk', :git => 'git://github.com/laurens/spree_tolk.git', :branch => '1-2-stable'

And run

    $ bundle install

Copy & run the migrations:

    $ bundle exec rake railties:install:migrations FROM=spree_tolk
    $ bundle exec rake db:migrate

Mount the engine in your routes.rb:

    Spree::Core::Engine.routes.draw do
        mount SpreeTolk::Engine => "/admin/tolk", :as => :tolk
    end

Add the spree_tolk stylesheet to admin/all.css

    *= require admin/spree_tolk

Add the spree_tolk javascript to admin/all.js

    //= require admin/spree_tolk

Usage
=======

Sync Tolk with the default locale's yml file:

    $ bundle exec rake tolk:sync

Generate yml files for all the locales defined in Tolk:

    $ bundle exec rake tolk:dump_all

Imports data all non default locale yml files to Tolk:

    $ bundle exec rake tolk:import

Show all the keys potentially containing HTML values and no _html postfix:

    $ bundle exec rake tolk:html_keys

Todo
=======

- [ ] Use a install generator
- [ ] Fix the tests
- [ ] Fix MimeType alias for Download of the YAML files (Currently use /admin/tolk/locales/de.yaml instead of de.yml to download)
- [ ] Ensure Spree 1.3 compatibility

<!-- Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 [name of extension creator], released under the New BSD License -->
