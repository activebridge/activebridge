module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(string.gsub('&nbsp;',' ')), length: 300)
  end
end
