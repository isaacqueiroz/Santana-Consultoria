# Email settings

  require 'smtp_tls'
  ActionMailer::Base.default_content_type = "text/html"
	ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
	  :address => "localhost",
	  :port => 587,
    :authentication => :login,
    :domain => "www.santanarh.com.br",
	  :user_name => "santanaconsultoria",
	  :password => "rh37275059"  
}
