atom_feed do |feed|
  feed.title I18n.t(:missing_translations_for_locale, :language => @locale.language_name)

  @phrases.each do |phrase|
    feed.entry(phrase, :url => tolk_locale_url(@locale)) do |entry|
      entry.title(phrase.key)
      entry.content(phrase.key)
      entry.author {|author| author.name("Tolk") }
    end
  end
end
