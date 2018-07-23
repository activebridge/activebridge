# frozen_string_literal: true

desc 'Get a list of users from a slack'
task get_users_from_slack: :environment do
  using DateRefinements

  if Date.today == Date.last_business_day_for_current_month
    # TODO: users should depends on company
    active_bridge = Company.default
    client = Slack::Client.new
    slack_users = client.users_list['members']

    slack_users.each do |slack_user|
      next if slack_user['name'].include?('bot')

      attributes = {
        name: slack_user['real_name'],
        slack_name: slack_user['name'],
        slack_id: slack_user['id'],
        deleted: slack_user['deleted'],
        status: slack_user['status'],
        company: active_bridge
      }

      user = User.find_or_initialize_by(slack_id: slack_user['id'])
      user.update_attributes attributes.merge(role: user.role || 'developer')
    end
  end
end
