# Email settings
	ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
	  :address => "localhost",
	  :port => 587,
	  :domain => "santanarh.com.br",
	  :authentication => :login,
	  :user_name => "santanaconsultoria",
	  :password => "rh37275059"  
}

