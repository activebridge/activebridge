module ApplicationHelper
  def svg(path, klass = nil)
    inline_svg("icons/#{path}.svg", class: "icon #{klass}")
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end

  def md(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
    markdown_to_html = Redcarpet::Markdown.new(coderayified, md_options)
    markdown_to_html.render(text).html_safe
  end

  def md_options
    {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      strikethrough: true,
      lax_html_blocks: true,
      superscript: true,
      tables: true
    }
  end
end
