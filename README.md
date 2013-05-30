SpreeTolk
=========

Edit your translations through the [Spree](http://github.com/spree/spree) Admin Area. 

This is a fork of [Tolk](http://github.com/tolk/tolk) 1.3.9 as a Spree 1.2 extension. 

Note: Still under development and needs some overhaul. Pull Requests welcome.

Note: Still under development and needs some overhaul. Pull Requests welcome.

Installation
=======

Add the following to your Gemfile

    gem 'spree_tolk', :git => 'git://github.com/laurens/spree_tolk.git', :branch => '1-5-stable'

Run the install generator

    $ bundle exec rails g spree_tolk:install

The install generator will add database migrations and admin stylesheets/javascripts to your spree app.

Usage
=======

## Rake tasks

Sync Tolk with the default locale’s yml file:

    $ bundle exec rake tolk:sync

This will generate yml files for all the locales defined in Tolk and put them into `#{Rails.root}/config/locales/`:

    $ bundle exec rake tolk:dump_all

Imports data from all non default locale yml files to Tolk:

    $ bundle exec rake tolk:import

Show all the keys potentially containing HTML values and no _html postfix:

    $ bundle exec rake tolk:html_keys

## Admin Interface

spree_tolk adds a tab called „Locales“ to the spree admin interface.

In order to download the yaml file, append `.yaml` to the locale path like

http://example.com/spree/admin/locales/de.yaml

Be sure to double check the output since Tolk messes up the formatting of some YAML keys in some cases, which you will have to fix manually.


Todo
=======

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
