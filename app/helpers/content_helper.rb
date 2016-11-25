module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 300)
  end
end
