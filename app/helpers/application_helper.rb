module ApplicationHelper
  MD_OPTIONS = %i(
    fenced_code_blocks
    no_intra_emphasis
    autolink
    strikethrough
    lax_html_blocks
    superscript
    tables
  ).each_with_object({}) { |e, o| o[e] = true }.freeze

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
    markdown_to_html = Redcarpet::Markdown.new(coderayified, MD_OPTIONS)
    markdown_to_html.render(text).html_safe
  end
end
