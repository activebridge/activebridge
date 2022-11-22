class Request < ApplicationMailer
  def notify(attrs)
    @reason = attrs['reason']
    @body = attrs['message']
    # @attachments= File.read(File.absolute_path(attrs[:attachments].tempfile))
    binding.pry
    mail(
      from: "#{attrs['name']} <#{attrs['email']}>",
      to: 'contact@active-bridge.com',
      subject: "Contact Us: #{attrs['name']}",
    )
  end

  def confirm(attrs)
    @name = attrs['name']
    mail(
      from: 'contact@active-bridge.com',
      to: attrs['email'],
      subject: 'Active Bridge ' + attrs['reason']
    )
  end
end
