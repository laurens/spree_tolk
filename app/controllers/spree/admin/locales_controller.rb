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
          format.yaml { render :text => @locale.to_hash.ya2yaml(:syck_compatible => true) }
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