require 'mail'
Mail.defaults do
  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
                           :port      => 587,
                           :domain    => "gmail.com",
                           :user_name => "maggiefei",
                           :password  => "heats33k",
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

mail = Mail.deliver do
  to 'mf3093@columbia.edu'
  from 'Maggie Fei <maggieyfei@gmail.com>'
  subject 'Testing Testing'
  text_part do
    body 'Im just suggesting'
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<b>Im just suggesting</b>'
  end
end
