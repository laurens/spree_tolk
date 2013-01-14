Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "add tolk tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:locales, :url => spree.tolk_path, :label => :translations, :match_path => '/tolk' ) %>",
                     :disabled => false)
