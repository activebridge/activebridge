module HostHelper
  def change_host(host)
    default_url_options[:host] = host
    Capybara.app_host = 'http://' + host
  end
end
