require 'mediawiktory/api_parser'

RSpec.describe MediaWiktory::ApiParser::Module do
  describe '.from_nodes' do
    subject(:mod) { described_class.from_nodes(title, nodes) }

    let(:nodes) { nodes_of(title) }

    def nodes_of(title)
      Nokogiri::HTML(File.read('spec/fixtures/api.php.html'))
        .at('#mw-content-text').children_groups('h3', 'div,p,h4')
        .select { |t, components| t.first&.text.to_s.start_with?('action=') }
        .detect { |t, components| t.first.text.include?(title) }.last
    end

    context 'abusefiltercheckmatch (simple)' do
      let(:title) { 'action=abusefiltercheckmatch' }

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
end
