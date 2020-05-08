class ApplicationController < ActionController::Base

	around_action :switch_locale
	 
	def switch_locale(&action)
	  locale = extract_locale_from_tld || I18n.default_locale
	  I18n.with_locale(locale, &action)
	end
	 
	def extract_locale_from_tld
	  @language = UserLanguage.find_by ip_address: remote_ip()
	  parsed_locale = @language.present? ? @language.language : 'en' 
	  I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
	end

	def remote_ip
      request.remote_ip
 	end

end
