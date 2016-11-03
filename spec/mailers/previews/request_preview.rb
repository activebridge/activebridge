# Preview all emails at http://localhost:3000/rails/mailers/request
class RequestPreview < ActionMailer::Preview
  def confirm
    Request.confirm(email: :test, name: 'Alex Galushka')
  end

  def notify
    Request.notify(email: :test, body: 'Test mail')
  end
end
