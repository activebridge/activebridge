class Request < ApplicationMailer
  def notify(attrs)
    mail_to(
      from: "#{attrs[:name]} <#{attrs[:email]}>",
      to: 'contact@active-bridge.com',
      subject: "Contact Us: #{attrs[:name]}",
      body: attrs[:message],
    )
  end

  def confirm(attrs)
    mail_to(
      from: 'contact@active-bridge.com',
      from: "#{attrs[:name]} <#{attrs[:email]}>",
      subject: "Contact Us: #{attrs[:name]}",
      body: attrs[:message],
  end
end
