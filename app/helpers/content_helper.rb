module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 490)
  end
end
