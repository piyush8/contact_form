class ContactMailer < ApplicationMailer
	def sent_contact_mail
	    @contact = params[:contact]
	    mail(to: 'snapmint@gmail.com', subject: "Contact Us Form")
	end
end
