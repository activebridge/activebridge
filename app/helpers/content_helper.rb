module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 200)
  end
end
