require 'mediawiktory/api_parser'

RSpec.describe MediaWiktory::ApiParser::Module do
  describe '.from_nodes' do
    subject(:mod) { described_class.from_nodes(title, nodes) }

    let(:nodes) { nodes_of(title) }

    def nodes_of(title)
      Nokogiri::HTML(File.read('spec/fixtures/api.php.html'))
        .at('#mw-content-text').children_groups('h3,h4', 'div,p')
        .select { |t, components| t.first&.text.to_s.start_with?('action=') }
        .detect { |t, components| t.first.text.include?(title) }.last
    end

    context 'abusefiltercheckmatch (simple)' do
      let(:title) { 'action=abusefiltercheckmatch' }

      its(:type) { is_expected.to eq :action }
      its(:title) { is_expected.to eq 'abusefiltercheckmatch' }
      its(:description) { is_expected.to eq \
        "Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.\n"\
        "vars, rcid or logid is required however only one may be used."
      }

      context '#params' do
        subject { mod.params }
        its(:count) { is_expected.to eq 4 }
        its_map(:name) { is_expected.to eq %w[filter vars rcid logid] }
      end
    end
  end

  describe '#to_param_docs' do
    let(:module) {
      described_class.new(
        title: 'json',
        description: 'Output data in JSON format.',
        params: [
          MediaWiktory::Api::Param.new(name: 'callback', type: 'string', description: 'If specified, wraps the output into a given function call. For safety, all user-specific data will be restricted.'),
          MediaWiktory::Api::Param.new(name: 'formatversion', type: 'enum', description: 'Output formatting:',
            vals: [
              {name: '1', description: 'Backwards-compatible format (XML-style booleans, * keys for content nodes, etc.).'},
              {name: '2', description: 'Experimental modern format. Details may change!'},
              {name: 'latest', description: 'Use the latest format (currently 2), may change without warning.'}
            ]
          )
        ]
      )
    }
  end

  describe '#to_action_class' do
  end
end
