Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "add locales tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:locales, :searches, :url => admin_locales_path ) %>",
                     :disabled => false)
