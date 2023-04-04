require 'liquid'
require 'jekyll_plugin_logger'
require_relative 'jekyll_context_inspector/version'

module JekyllPlubinContextInspectorName
  PLUGIN_NAME = 'context_inspector'.freeze
end

class ContextInspector < Liquid::Tag
  def render(context)
    @logger = PluginMetaLogger.instance.new_logger(self, PluginMetaLogger.instance.config)
    site = context.registers[:site]
    inspector_enabled = site.config['context_inspector']
    return if inspector_enabled.nil? || !inspector_enabled

    mode = site.config['env']['JEKYLL_ENV']
    return unless inspector_enabled == 'force' || mode == 'development'

    dump_info(context)
  end

  private

  def dump_info(context)
    page = context.registers[:page]
    info do
      key_value_pairs = context.registers.map do |key, value|
        "  <code>#{key}</code> has a value with type <code>#{value.class}</code>"
      end
      vars = page.keys.sort.join('</code>, <code>')
      <<~END_MESSAGE
        context for #{page.path} is of type #{context.class}.
        context.registers for #{page.path} contains the following key/value pairs:
        #{key_value_pairs.join("\n")}
        #{JekyllPlubinContextInspectorName::PLUGIN_NAME}: #{page.path} contains the following key/value pairs:
        <p class='info'>Jekyll variables for this page are:
        <code>#{vars}</code></p>
      END_MESSAGE
    end
  end
end

Liquid::Template.register_tag(JekyllPlubinContextInspectorName::PLUGIN_NAME, ContextInspector)
PluginMetaLogger.instance.info { "Loaded #{JekyllPlubinContextInspectorName::PLUGIN_NAME} v#{JekyllContextInspectorVersion::VERSION} plugin." }
