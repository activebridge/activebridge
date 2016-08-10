module ApplicationHelper
  def svg(path, klass = nil)
    self.inline_svg("icons/#{path}.svg", class: "icon #{klass}")
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
        message
      end)
    end
    nil
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end

  def md(text)
    coderayified = CodeRayify.new(filter_html: true,
                                hard_wrap: true)
    options = {
    fenced_code_blocks: true,
    no_intra_emphasis: true,
    autolink: true,
    strikethrough: true,
    lax_html_blocks: true,
    superscript: true,
    tables: true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
end
