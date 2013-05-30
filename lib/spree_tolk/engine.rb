module SpreeTolk
  class Engine < Rails::Engine
    SafeYAML::OPTIONS[:default_mode] = :safe
    SafeYAML::OPTIONS[:deserialize_symbols] = true

    require 'spree/core'
    isolate_namespace Tolk
    engine_name 'spree_tolk'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree_tolk.init_yaml_export" do
      # FIXME this does not seem to work:
      Mime::Type.register_alias "text/yaml", :yml

      $KCODE = 'UTF8'
      begin
        require 'ya2yaml'
      rescue LoadError => e
        Rails.logger.debug "[Tolk] Could not load ya2yaml"
      end
    end
  end
end
