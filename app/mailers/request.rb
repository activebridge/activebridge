class Request < ApplicationMailer
  def notify(attrs)
    @reason = attrs['reason']
    @body = attrs['message']
    binding.pry
    @attachments= File.read(File.absolute_path(attrs[:attachments].tempfile))
    mail(
      from: "#{attrs['name']} <#{attrs['email']}>",
      to: 'kate@active-bridge.com',
      subject: "Contact Us: #{attrs['name']}",
    )
  end

  def confirm(attrs)
    @name = attrs['name']
    binding.pry
    mail(
      from: 'kate@active-bridge.com',
      to: attrs['email'],
      subject: 'Active Bridge ' + attrs['reason']
    )
  end
end
