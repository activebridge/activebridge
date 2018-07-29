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

  def project_name(project)
    project.downcase.gsub(/[,.]/, '').tr(' ', '_')
  end

  def next_project(projects, i)
    projects.length.pred == i ? project_name(projects[0].client) : project_name(projects[i.next].client)
  end
end
