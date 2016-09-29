class Request < ApplicationMailer
  def notify(attrs)
    mail(
      from: "#{attrs[:name]} <#{attrs[:email]}>",
      to: 'contact@active-bridge.com',
      subject: "Contact Us: #{attrs[:name]}",
      body: attrs[:message],
    )
  end

  def confirm(attrs)
    @name = attrs[:name]
    mail(
      from: attrs[:email],
      to: 'contact@active-bridge.com',
      subject: "Active Bridge",
    )
  end
end
