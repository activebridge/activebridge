module ContentHelper
  def clean_truncate(string)
    truncate(strip_tags(md(string)), length: 200)
  end

  def meta_blog_tags(type, category = nil, page = nil)
    if category
      meta_blog_content(page, t("meta.pages.blog.categories.#{category}.#{type}"))
    else
      meta_blog_content(page, t("meta.pages.blog.#{type}"))
    end
  end

  def meta_blog_content(page, content)
    if page
      "#{content} - page #{page}"
    else
      content
    end
  end
end
