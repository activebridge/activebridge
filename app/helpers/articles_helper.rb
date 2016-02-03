module ArticlesHelper
  def pending_link
    if current_user.try(:member?)
      active_link_to 'My pending posts', index_articles_path(:pending), active: :exact
    elsif current_user.try(:moderator?)
      active_link_to 'Pending posts', index_articles_path(:pending), active: :exact
    end
  end
end
