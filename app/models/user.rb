class User < ActiveRecord::Base
  include UserOmniable
  has_many :accounts
  has_many :articles

  enum role: [:user, :member, :moderator]

  accepts_nested_attributes_for :accounts

  def check_member
    member! if email.split('@')[1] == 'active-bridge.com'
  end

  def authorized_to_create
    member? || moderator?
  end

  def full_name
    [first_name, last_name].join(' ').strip
  end
end
