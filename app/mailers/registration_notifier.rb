class RegistrationNotifier < ApplicationMailer
  default to: 'ericb.stephenson@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.registration_notifier.received.subject
  #
  def mandrill_client
    @mandrill_client ||= Mandrill::API.new MANDRILL_APIKEY
  end
  
  def received(user)
    @user = user
    mail to: user.email, subject: 'Thank You For Registering With Griffen'
  end
  
  def new_user(user)
    template_name = "Registration"
    template_content = []
    message = {
      to: [{email: user.email }],
      subject: "Thank You For Registering With Griffen"
      }
    
    mandrill_client.messages.send_template template_name, template_content, message
  end
  
  
end
