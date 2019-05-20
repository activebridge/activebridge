module ApplicationHelper
  MD_OPTIONS = %i[
    fenced_code_blocks
    no_intra_emphasis
    autolink
    strikethrough
    lax_html_blocks
    superscript
    tables
  ].each_with_object({}) { |e, o| o[e] = true }.freeze

  def svg(path, klass = nil)
    inline_svg("icons/#{path}.svg", class: "icon #{klass}")
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div(css: :class)
    end
  end

  def md(text)
    coderayified = CodeRayify.new(hard_wrap: true)
    markdown_to_html = Redcarpet::Markdown.new(coderayified, MD_OPTIONS)
    markdown_to_html.render(text).html_safe
  end

  def back_path
    if request.referer.present? && request.referer != request.env['REQUEST_URI']
      "#{url_for(:back)}#posts"
    else
      "#{articles_url}#posts"
    end
  end

  def id_name(str)
    str.downcase.gsub(' ', '-')
  end

  def id_member(member)
    member.downcase.gsub(/[ -]/, '_')
  end

  def item_name(name)
    name.downcase.gsub(/[,.]/, '').tr(' ', '-')
  end

  def next_item(items, i)
    items.length.pred == i ? items[0] : items[i.next]
  end


  def meta_title
    t("meta.pages.#{params[:page].blank? ? "/" : params[:page]}.title", default: 'Ruby on Rails Development Company')
  end

  def show_schema
    t("meta.schema.#{params[:page].blank? ? "/" : params[:page]}").html_safe
  end
end
