# frozen_string_literal: true

require "jekyll"
require_relative "jekyll_context_inspector/version"
require "jekyll_plugin_logger"

module Jekyll
  class ContextInspector < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      inspector_enabled = site.config["context_inspector"]
      return if inspector_enabled.nil? || !inspector_enabled

      mode = site.config["env"]["JEKYLL_ENV"]
      return unless inspector_enabled == "force" || mode == "development"

      dump_info(context)
    end

    private

    def dump_info(context)
      debug "context is of type #{context.class}"

      info("context.registers contains the following key/value pairs:")
      context.registers.each do |key, value|
        info "  '#{key}' is of type #{value.class}"
      end

      page = context.registers[:page]
      info "page contains the following key/value pairs: #{page.keys.sort.join(", ")}"
      "<p class='info'>Jekyll variables for this page are: <code>#{page.keys.sort.join("</code>, <code>")}</code></p>"
    end
  end

  Liquid::Template.register_tag("context_inspector", ContextInspector)
  info "Loaded jekyll_context_inspector plugin."
end
