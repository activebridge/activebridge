module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 490)
  end

  def render_empty_boxes(articles)
    empty_boxes = 4 - articles.count
    box = "<div class='post'></div>"

    box.html_safe if empty_boxes.odd?
  end
end
