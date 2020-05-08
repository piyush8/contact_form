class HomeController < ApplicationController
	def index
		@language = UserLanguage.find_by ip_address: remote_ip()
		@contact = Contact.new
	end

	def get_form_data
		contact = Contact.new(contact_params)
		if contact.save
			ContactMailer.with(contact: contact).sent_contact_mail.deliver_now	
      		flash[:notice] = "Details saved and mail sent successfully."
		else
      		flash[:error] = "Details not saved due to some error."
		end
		redirect_to root_path
	end

	def store_language
		lang = params["language"].present? ? params["language"].downcase[0..1] : 'en'
		@language = UserLanguage.find_by ip_address: remote_ip()
		if @language.present?
			@language.update(ip_address: remote_ip(), language: lang)
		else
			UserLanguage.create(ip_address: remote_ip(), language: lang)
		end
		respond_to do |format|
		    format.html  { redirect_to root_path }
		    format.js  { redirect_to root_path }
  		end
	end

	def list_of_contact
		@contacts = Contact.all
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name, :last_name, :email, :mobile, :message)
	end
end
