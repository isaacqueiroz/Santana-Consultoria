class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Ativação de Conta.'
    
    @body[:url]  = "http://www.santanarh.com.br/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Sua conta foi ativada!'
    @body[:url]  = "http://www.santanarh.com.br/"
  end
	
	def forgot_password(user)
    setup_email(user)
    @subject    += 'Mudança de Senha Requisitada.'
    @body[:url]  = "http://www.santanarh.com.br/reset_password/#{user.password_reset_code}"
   end
  def reset_password(user)
    setup_email(user)
    @subject    += 'Sua senha foi Alterada. '
  end

  def question(email_params, sent_at = Time.now)
    subject = "[Santana RH] " << email_params[:subject]
    recipients = "contato@santanarh.com.br"
    from = email_params[:address]
    sent_on = sent_at

    # allows access to @message and @sender_name
    # in the view
    body :message => email_params[:body], :sender_name => email_params[:name]
  end

  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "contato@santanarh.com.br"
      @subject     = "[Santana Consultoria]"
      @sent_on     = Time.now
      @body[:user] = user
    end

end
