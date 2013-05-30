module Spree
  module Admin
    class LocalesController < BaseController
      before_filter :find_locale, :only => [:show, :all, :update, :updated]
      before_filter :ensure_no_primary_locale, :only => [:all, :update, :show, :updated]

      def index
        @locales = Tolk::Locale.secondary_locales.sort_by(&:language_name)
      end

      def search
        find_locale(params[:tolk_locale])
        @phrases = @locale.search_phrases(params[:q], params[:scope].to_sym, params[:k], params[:page])
      end

      def show
        respond_to do |format|
          format.html do
            @phrases = @locale.phrases_without_translation(params[:page])
          end
          format.atom { @phrases = @locale.phrases_without_translation(params[:page], {:per_page => 50 }) }
          format.yaml do
            data = @locale.to_hash
            render :text => data.respond_to?(:ya2yaml) ? data.ya2yaml(:syck_compatible => true) : YAML.dump(data).force_encoding("UTF-8")
          end
        end
      end

      def all
        @phrases = @locale.phrases_with_translation(params[:page])
      end

      def updated
        @phrases = @locale.phrases_with_updated_translation(params[:page])
        render :all
      end

      def create
        Tolk::Locale.create!(params[:tolk_locale])
        redirect_to :action => :index
      end

      def update
        @locale.translations_attributes = params[:translations]
        @locale.save
        redirect_to request.referrer
      end

      def dump_all
        Tolk::Locale.dump_all
        I18n.reload!
        redirect_to request.referrer
      end

      def stats
        @locales = Tolk::Locale.secondary_locales.sort_by(&:language_name)

        respond_to do |format|
          format.json do
            stats = @locales.collect do |locale|
              [locale.name, {
                :missing => locale.count_phrases_without_translation,
                :updated => locale.count_phrases_with_updated_translation,
                :updated_at => locale.updated_at
              }]
            end
            render :json => Hash[stats]
          end
        end
      end

      private

      def find_locale(locale = params[:id])
        @locale = Tolk::Locale.where('UPPER(name) = UPPER(?)', locale).first!
      end

      def ensure_no_primary_locale
        redirect_to admin_locales_path if @locale.primary?
      end
    end
  end
end