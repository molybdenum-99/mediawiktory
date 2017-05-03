require 'mediawiktory/generator'

RSpec.describe MediaWiktory::Generator::Module do
  describe '.from_nodes' do
    subject(:mod) { described_class.from_nodes(title, nodes) }

    let(:nodes) { nodes_of(title) }

    def nodes_of(title)
      Nokogiri::HTML(File.read('spec/fixtures/api.php.html'))
        .at('#mw-content-text').children_groups('h3,h4', 'div,p')
        .select { |t, components| t.first._n.text.to_s.start_with?('action=') }
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

  describe '#to_html' do
    subject { mod.to_html(namespace: 'Dummy') }
    let(:mod) { described_class.from_html_nodes(name, nodes) }

    let(:name) { 'action=abusefiltercheckmatch' }
    let(:nodes) { Nokogiri::HTML.fragment(source).children }

    let(:source) { %Q{
      <div class="apihelp-block apihelp-flags"><ul><li><span class="apihelp-flag-readrights">This module requires read rights.</span></li><li><span class="apihelp-source">Source: <span dir="ltr" lang="en">Abuse Filter</span></span></li><li><span class="apihelp-license">License: <a href="/wiki/Special:Version/License/Abuse_Filter" title="Special:Version/License/Abuse Filter"><span dir="ltr" lang="en">GPL-2.0+</span></a></span></li></ul></div>
      <p>Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.
      </p><p>vars, rcid or logid is required however only one may be used.
      </p>

      <div class="apihelp-block apihelp-parameters"><div class="apihelp-block-head">Parameters:</div><dl><dt><span dir="ltr" lang="en">filter</span></dt><dd class="description"><p>The full filter text to check for a match.
      </p></dd><dd class="info">This parameter is required.</dd><dt><span dir="ltr" lang="en">vars</span></dt><dd class="description"><p>JSON encoded array of variables to test against.
      </p></dd><dt><span dir="ltr" lang="en">rcid</span></dt><dd class="description"><p>Recent change ID to check against.
      </p></dd><dd class="info">Type: integer</dd><dt><span dir="ltr" lang="en">logid</span></dt><dd class="description"><p>Abuse filter log ID to check against.
      </p></dd><dd class="info">Type: integer</dd></dl></div>
      <div class="apihelp-block apihelp-examples"><div class="apihelp-block-head">Example:</div><dl><dt>Test if recent change ID 15 matches a simple filter</dt><dd><a href="/w/api.php?action=abusefiltercheckmatch&amp;filter=!(%22autoconfirmed%22%20in%20user_groups)&amp;rcid=15" dir="ltr">api.php?action=abusefiltercheckmatch&amp;filter=!("autoconfirmed"%20in%20user_groups)&amp;rcid=15</a> <a href="/wiki/Special:ApiSandbox#action=abusefiltercheckmatch&amp;filter=!(%22autoconfirmed%22%20in%20user_groups)&amp;rcid=15"><small>[open in sandbox]</small></a></dd></dl></div>
    } }

    it 'renders class' do
      is_expected.to include("module Dummy\n  module Actions")
        .and include("\n    class Abusefiltercheckmatch < Dummy::Actions::Get")
    end

    it 'renders generic docs' do
      is_expected
        .to include("    # Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.")
        .and include('api.abusefiltercheckmatch(**options).perform')
    end

    it 'renders param docs' do
      is_expected.to include(%Q{
        |
        |      # The full filter text to check for a match.
        |      #
        |      # @param value [String]
        |      # @return [self]
        |      def filter(value)
        |        merge(filter: value.to_s)
        |      end
      }.unindent)
    end

    context 'when post module' do
      let(:source) { %Q{
        <div class="apihelp-block apihelp-flags"><ul><li><span class="apihelp-flag-readrights">This module requires read rights.</span></li><li><span class="apihelp-source">Source: <span dir="ltr" lang="en">Abuse Filter</span></span></li><li><span class="apihelp-flag-mustbeposted">This module only accepts POST requests.</span></li><li><span class="apihelp-license">License: <a href="/wiki/Special:Version/License/Abuse_Filter" title="Special:Version/License/Abuse Filter"><span dir="ltr" lang="en">GPL-2.0+</span></a></span></li></ul></div>
        <p>Check to see if an AbuseFilter matches a set of variables, editor logged AbuseFilter event.
        </p><p>vars, rcid or logid is required however only one may be used.
        </p>

        <div class="apihelp-block apihelp-parameters"><div class="apihelp-block-head">Parameters:</div><dl><dt><span dir="ltr" lang="en">filter</span></dt><dd class="description"><p>The full filter text to check for a match.
        </p></dd><dd class="info">This parameter is required.</dd><dt><span dir="ltr" lang="en">vars</span></dt><dd class="description"><p>JSON encoded array of variables to test against.
        </p></dd><dt><span dir="ltr" lang="en">rcid</span></dt><dd class="description"><p>Recent change ID to check against.
        </p></dd><dd class="info">Type: integer</dd><dt><span dir="ltr" lang="en">logid</span></dt><dd class="description"><p>Abuse filter log ID to check against.
        </p></dd><dd class="info">Type: integer</dd></dl></div>
        <div class="apihelp-block apihelp-examples"><div class="apihelp-block-head">Example:</div><dl><dt>Test if recent change ID 15 matches a simple filter</dt><dd><a href="/w/api.php?action=abusefiltercheckmatch&amp;filter=!(%22autoconfirmed%22%20in%20user_groups)&amp;rcid=15" dir="ltr">api.php?action=abusefiltercheckmatch&amp;filter=!("autoconfirmed"%20in%20user_groups)&amp;rcid=15</a> <a href="/wiki/Special:ApiSandbox#action=abusefiltercheckmatch&amp;filter=!(%22autoconfirmed%22%20in%20user_groups)&amp;rcid=15"><small>[open in sandbox]</small></a></dd></dl></div>
      } }

      it 'renders class' do
        is_expected.to include("module Dummy\n  module Actions")
          .and include("\n    class Abusefiltercheckmatch < Dummy::Actions::Post")
      end
    end
  end
end
