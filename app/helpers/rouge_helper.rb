module RougeHelper
  # require 'redcarpet'
  # require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def markdown(text)
    render_options = {
      link_attributes: { target: "_blank" }
    }

    renderer = HTML.new(render_options)

    extensions = {
      autolink: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      tables: true,
      strikethrough: true,
      # lax_spacing: true,
      # underline: true,
      highlight: true
    }

    markdown = Redcarpet::Markdown.new(renderer, extensions)
    content_tag(:div, markdown.render(text).html_safe, class: 'markdown-body')
  end
end
