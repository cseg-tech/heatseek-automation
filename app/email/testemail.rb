require 'logger'
require 'mail'

class EmailClient
  def initialize(config)
    @config = config
    @logger = Logger.new(STDOUT)
    Mail.defaults do
      delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                               :port      => 587,
                               :domain    => "gmail.com",
                               :user_name => "maggiefei",
                               :password  => "heats33k",
                               :authentication => 'plain',
                               :enable_starttls_auto => true } 
    end
  end
  

  def send_email(email)
    @logger.info("Sending email")
    Mail.deliver do 
      to email.to
      from email.from
      subject email.subject
      text_part do 
        email.text_body 
      end 
      html_part do
        content_type email.content_type
        body email.html_body
      end
    end
  end

end