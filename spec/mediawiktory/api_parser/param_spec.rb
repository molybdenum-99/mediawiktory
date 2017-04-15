require 'mediawiktory/api_parser'

RSpec.describe MediaWiktory::ApiParser::Param do
  describe '.from_html_nodes' do
    subject(:param) { described_class.from_html_nodes(name, dds) }

    let(:name) { 'test' }
    let(:dds) { Nokogiri::HTML(source).search('dd') }

    context 'string' do
      let(:source) {%Q{
        <dd class="description"><p>The full filter text to check for a match.</p></dd>
        <dd class="info">This parameter is required.</dd>
      }}

      its(:type) { is_expected.to eq 'string' }
      its(:description) { is_expected.to eq 'The full filter text to check for a match.' }
    end

    context 'boolean' do
      let(:source) {%Q{
        <dd class="description"><p>Recent change ID to check against.</p></dd>
        <dd class="info">Type: integer</dd>
      }}

      its(:type) { is_expected.to eq 'integer' }
      its(:description) { is_expected.to eq 'Recent change ID to check against.' }
    end

    context 'just list' do
      let(:source) {%Q{
        <dd class="description"><p>The usernames of the students to add to the course.</p></dd>
        <dd class="info">This parameter is required.</dd><dd class="info">Separate values with <kbd>|</kbd> or <a href="#main.2Fdatatypes">alternative</a>. Maximum number of values is 50 (500 for bots).</dd>
      }}

      its(:type) { is_expected.to eq 'list' }
      its(:description) { is_expected.to eq 'The usernames of the students to add to the course.' }
      its(:vals) { is_expected.to be_nil }
    end

    context 'boolean' do
      let(:source) {%Q{
        <dd class="description"><p>Block anonymous users only (i.e. disable anonymous edits for this IP address).
        </p></dd><dd class="info">Type: boolean (<a href="#main.2Fdatatypes">details</a>)</dd>
      }}

      its(:type) { is_expected.to eq 'boolean' }
      its(:description) { is_expected.to eq 'Block anonymous users only (i.e. disable anonymous edits for this IP address).' }
    end

    context 'enum' do
      let(:source) {%Q{
        <dd class="description"><p>Type of token being tested.
        </p></dd><dd class="info">This parameter is required.</dd>
        <dd class="info">One of the following values: <span dir="auto">createaccount</span>, <span dir="auto">csrf</span>, <span dir="auto">deleteglobalaccount</span>, <span dir="auto">login</span>, <span dir="auto">patrol</span>, <span dir="auto">rollback</span>, <span dir="auto">setglobalaccountstatus</span>, <span dir="auto">userrights</span>, <span dir="auto">watch</span></dd>
      }}

      its(:type) { is_expected.to eq 'enum' }
      its(:description) { is_expected.to eq 'Type of token being tested.' }
      its(:vals) { are_expected.to eq %w[createaccount csrf deleteglobalaccount login patrol rollback setglobalaccountstatus userrights watch] }
    end


    context 'list with possible values' do
      let(:source) {%Q{
        <dd class="description"><p>Change tags to apply to the entry in the deletion log.
        </p></dd><dd class="info">Values (separate with <kbd>|</kbd> or <a href="#main.2Fdatatypes">alternative</a>): ProveIt edit, WPCleaner, huggle, large plot addition</dd>
      }}

      its(:type) { is_expected.to eq 'list' }
      its(:description) { is_expected.to eq 'Change tags to apply to the entry in the deletion log.' }
      its(:vals) { are_expected.to eq ['ProveIt edit', 'WPCleaner', 'huggle', 'large plot addition'] }
    end
  end
end
