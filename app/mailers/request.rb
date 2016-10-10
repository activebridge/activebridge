class Request < ApplicationMailer
  def notify(attrs)
    @body = attrs[:body]
    mail(
      from: "#{attrs[:name]} <#{attrs[:email]}>",
      to: 'contact@active-bridge.com',
      subject: "Contact Us: #{attrs[:name]}",
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
