class ApplicationMailer < ActionMailer::Base
  #my email address as default
  default from: "rategyst@gmail.com"
  layout "mailer"
end
