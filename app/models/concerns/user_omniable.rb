module UserOmniable
  extend ActiveSupport::Concern
  included do
    def self.from_omniauth(auth)
      user = joins(:accounts).where('accounts.provider = (?) AND accounts.uid = (?)', auth["provider"], auth["uid"]).first_or_create do |user|
        user.email = auth["info"]["email"]
        user.first_name = auth["info"]["first_name"]
        user.last_name = auth["info"]["last_name"]
        user.image = auth["info"]["image"]
        user.send(auth["provider"], auth)
      end
    end
  end

  def google_oauth2(auth)
    assign_attributes(
      accounts_attributes: [{
        provider: auth['provider'],
        uid: auth['uid'],
        token: auth['credentials']['token']
      }]
    )
  end
end
