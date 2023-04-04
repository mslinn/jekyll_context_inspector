require 'jekyll'
require_relative '../lib/jekyll_context_inspector'

RSpec.describe(Jekyll) do
  include described_class

  let(:config) { instance_double('Configuration') }
  let(:context) do
    context_ = instance_double('Liquid::Context')
    context_.config = config
    context_
  end

  it 'is created properly' do
    # expect(output).to eq('asdf')
  end
end
