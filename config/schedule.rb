every 1.day, at: '7:30 am' do
  rake 'sitemap:refresh'
end

every 1.day, at: '9:30 am' do
  rake 'get_users_from_slack'
end

every 1.day, at: '10:30 am' do
  rake 'accounting_bot'
end

