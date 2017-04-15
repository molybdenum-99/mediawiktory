require 'mediawiktory/api_parser'

RSpec.describe MediaWiktory::ApiParser::Param do
  describe '.from_html_nodes' do
    subject(:param) { described_class.from_html_nodes(name, dds) }

    let(:name) { 'test' }
    let(:dds) { Nokogiri::HTML.fragment(source).children.select { |c| c.name == 'dd' } }

    context 'string' do
      let(:source) {%Q{
        <dd class="description"><p>The full filter text to check for a match.</p></dd>
        <dd class="info">This parameter is required.</dd>
      }}

      its(:type) { is_expected.to eq 'string' }
      its(:description) { is_expected.to eq 'The full filter text to check for a match.' }
    end

    context 'integer' do
      let(:source) {%Q{
        <dd class="description"><p>Recent change ID to check against.</p></dd>
        <dd class="info">Type: integer</dd>
      }}

      its(:type) { is_expected.to eq 'integer' }
      its(:description) { is_expected.to eq 'Recent change ID to check against.' }
    end

    context 'boolean' do
      let(:source) {%Q{
        <dd class="description"><p>Block anonymous users only (i.e. disable anonymous edits for this IP address).
        </p></dd><dd class="info">Type: boolean (<a href="#main.2Fdatatypes">details</a>)</dd>
      }}

      its(:type) { is_expected.to eq 'boolean' }
      its(:description) { is_expected.to eq 'Block anonymous users only (i.e. disable anonymous edits for this IP address).' }
    end

    context 'timestamp' do
      let(:source) {%Q{
        <dd class="description"><p>Timestamp when the editing process began, used to detect edit conflicts. An appropriate value may be obtained using <var><a href="#main">curtimestamp</a></var> when beginning the edit process (e.g. when loading the page content to edit).
        </p></dd><dd class="info">Type: timestamp (<a href="#main.2Fdatatypes">allowed formats</a>)</dd>
      }}

      its(:type) { is_expected.to eq 'timestamp' }
      its(:description) { is_expected.to eq 'Timestamp when the editing process began, used to detect edit conflicts. An appropriate value may be obtained using curtimestamp when beginning the edit process (e.g. when loading the page content to edit).' }
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

    context 'just list' do
      let(:source) {%Q{
        <dd class="description"><p>The usernames of the students to add to the course.</p></dd>
        <dd class="info">This parameter is required.</dd><dd class="info">Separate values with <kbd>|</kbd> or <a href="#main.2Fdatatypes">alternative</a>. Maximum number of values is 50 (500 for bots).</dd>
      }}

      its(:type) { is_expected.to eq 'list' }
      its(:description) { is_expected.to eq 'The usernames of the students to add to the course.' }
      its(:vals) { is_expected.to be_nil }
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

    context 'list with possible values -- detailed explanation' do
      let(:source) {%Q{
        <dd class="description"><p>Which pieces of information to get.
        </p><p>Note that if no values are selected, the result will contain the wikitext, but the output will be in a deprecated format.
        </p><dl><dt><span dir="ltr" lang="en">wikitext</span></dt>
        <dd>The expanded wikitext.</dd>
        <dt><span dir="ltr" lang="en">categories</span></dt>
        <dd>Any categories present in the input that are not represented in the wikitext output.</dd>
        <dt><span dir="ltr" lang="en">properties</span></dt>
        <dd>Page properties defined by expanded magic words in the wikitext.</dd>
        <dt><span dir="ltr" lang="en">volatile</span></dt>
        <dd>Whether the output is volatile and should not be reused elsewhere within the page.</dd>
        <dt><span dir="ltr" lang="en">ttl</span></dt>
        <dd>The maximum time after which caches of the result should be invalidated.</dd>
        <dt><span dir="ltr" lang="en">modules</span></dt>
        <dd>Any ResourceLoader modules that parser functions have requested be added to the output. Either <kbd>jsconfigvars</kbd> or <kbd>encodedjsconfigvars</kbd> must be requested jointly with <kbd>modules</kbd>.</dd>
        <dt><span dir="ltr" lang="en">jsconfigvars</span></dt>
        <dd>Gives the JavaScript configuration variables specific to the page.</dd>
        <dt><span dir="ltr" lang="en">encodedjsconfigvars</span></dt>
        <dd>Gives the JavaScript configuration variables specific to the page as a JSON string.</dd>
        <dt><span dir="ltr" lang="en">parsetree</span></dt>
        <dd>The XML parse tree of the input.</dd></dl></dd><dd class="info">Values (separate with <kbd>|</kbd> or <a href="#main.2Fdatatypes">alternative</a>): <span dir="auto">wikitext</span>, <span dir="auto">categories</span>, <span dir="auto">properties</span>, <span dir="auto">volatile</span>, <span dir="auto">ttl</span>, <span dir="auto">modules</span>, <span dir="auto">jsconfigvars</span>, <span dir="auto">encodedjsconfigvars</span>, <span dir="auto">parsetree</span></dd>
      }}

      its(:type) { is_expected.to eq 'list' }
      its(:description) { is_expected.to eq "Which pieces of information to get.\n"\
        'Note that if no values are selected, the result will contain the wikitext, but the output will be in a deprecated format.'
      }
      its(:vals) { are_expected.to eq [
        {"name"=>"wikitext", "description"=>"The expanded wikitext."},
        {"name"=>"categories", "description"=> "Any categories present in the input that are not represented in the wikitext output."},
        {"name"=>"properties", "description"=> "Page properties defined by expanded magic words in the wikitext."},
        {"name"=>"volatile", "description"=> "Whether the output is volatile and should not be reused elsewhere within the page."},
        {"name"=>"ttl", "description"=> "The maximum time after which caches of the result should be invalidated."},
        {"name"=>"modules", "description"=> "Any ResourceLoader modules that parser functions have requested be added to the output. Either jsconfigvars or encodedjsconfigvars must be requested jointly with modules."},
        {"name"=>"jsconfigvars", "description"=> "Gives the JavaScript configuration variables specific to the page."},
        {"name"=>"encodedjsconfigvars", "description"=> "Gives the JavaScript configuration variables specific to the page as a JSON string."},
        {"name"=>"parsetree", "description"=>"The XML parse tree of the input."}
      ]}

    end
  end
end
