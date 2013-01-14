Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "add tolk tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:locales, :searches, :url => spree.tolk_path ) %>",
                     :disabled => false)
