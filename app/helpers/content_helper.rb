module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 300)
  end

  def render_category_name(value)
    I18n.t('category').find { |category| category.last == value }&.first || 'All Posts'
  end
end
