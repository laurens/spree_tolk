class AddLanguageNameToTolkLocales < ActiveRecord::Migration
  def self.up
    add_column :tolk_locales, :language_name, :string
    
    Tolk::Locale.all.each do |locale|
      locale.language_name = Tolk.config.mapping[locale.name] || locale.name
      locale.save!
    end
  end

  def self.down
    remove_column :tolk_locales, :language_name
  end
end