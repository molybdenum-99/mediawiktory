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

    context 'one of "modules"' do
      let(:source) {%Q{
        <dd class="description"><p>The format of the output.
        </p></dd><dd class="info">One of the following values: <a href="#json"><span dir="ltr" lang="en">json</span></a>, <a href="#jsonfm"><span dir="ltr" lang="en">jsonfm</span></a>, <a href="#none"><span dir="ltr" lang="en">none</span></a>, <a href="#php"><span dir="ltr" lang="en">php</span></a>, <a href="#phpfm"><span dir="ltr" lang="en">phpfm</span></a>, <a href="#rawfm"><span dir="ltr" lang="en">rawfm</span></a>, <a href="#xml"><span dir="ltr" lang="en">xml</span></a>, <a href="#xmlfm"><span dir="ltr" lang="en">xmlfm</span></a></dd><dd class="info">Default: <span dir="auto">jsonfm</span></dd>
      }}

      its(:type) { is_expected.to eq 'enum' }
      its(:description) { is_expected.to eq 'The format of the output.' }
      its(:vals) { are_expected.to eq [
        {"name"=>"json", "module"=>"json"},
        {"name"=>"jsonfm", "module"=>"jsonfm"},
        {"name"=>"none", "module"=>"none"},
        {"name"=>"php", "module"=>"php"},
        {"name"=>"phpfm", "module"=>"phpfm"},
        {"name"=>"rawfm", "module"=>"rawfm"},
        {"name"=>"xml", "module"=>"xml"},
        {"name"=>"xmlfm", "module"=>"xmlfm"}
      ]}
    end

    context 'list of "modules"' do
      let(:source) {%Q{
        <dd class="description"><p>Which properties to get for the queried pages.
        </p></dd><dd class="info">Values (separate with <kbd>|</kbd> or <a href="#main.2Fdatatypes">alternative</a>): <a href="#query+categories"><span dir="ltr" lang="en">categories</span></a>, <a href="#query+categoryinfo"><span dir="ltr" lang="en">categoryinfo</span></a>, <a href="#query+contributors"><span dir="ltr" lang="en">contributors</span></a>, <a href="#query+coordinates"><span dir="ltr" lang="en">coordinates</span></a>, <a href="#query+deletedrevisions"><span dir="ltr" lang="en">deletedrevisions</span></a>, <a href="#query+duplicatefiles"><span dir="ltr" lang="en">duplicatefiles</span></a>, <a href="#query+extlinks"><span dir="ltr" lang="en">extlinks</span></a>, <a href="#query+extracts"><span dir="ltr" lang="en">extracts</span></a>, <a href="#query+fileusage"><span dir="ltr" lang="en">fileusage</span></a>, <a href="#query+flagged"><span dir="ltr" lang="en">flagged</span></a>, <a href="#query+globalusage"><span dir="ltr" lang="en">globalusage</span></a>, <a href="#query+imageinfo"><span dir="ltr" lang="en">imageinfo</span></a>, <a href="#query+images"><span dir="ltr" lang="en">images</span></a>, <a href="#query+info"><span dir="ltr" lang="en">info</span></a>, <a href="#query+iwlinks"><span dir="ltr" lang="en">iwlinks</span></a>, <a href="#query+langlinks"><span dir="ltr" lang="en">langlinks</span></a>, <a href="#query+links"><span dir="ltr" lang="en">links</span></a>, <a href="#query+linkshere"><span dir="ltr" lang="en">linkshere</span></a>, <a href="#query+mapdata"><span dir="ltr" lang="en">mapdata</span></a>, <a href="#query+pageassessments"><span dir="ltr" lang="en">pageassessments</span></a>, <a href="#query+pageimages"><span dir="ltr" lang="en">pageimages</span></a>, <a href="#query+pageprops"><span dir="ltr" lang="en">pageprops</span></a>, <a href="#query+pageterms"><span dir="ltr" lang="en">pageterms</span></a>, <a href="#query+pageviews"><span dir="ltr" lang="en">pageviews</span></a>, <a href="#query+redirects"><span dir="ltr" lang="en">redirects</span></a>, <a href="#query+references"><span dir="ltr" lang="en">references</span></a>, <a href="#query+revisions"><span dir="ltr" lang="en">revisions</span></a>, <a href="#query+stashimageinfo"><span dir="ltr" lang="en">stashimageinfo</span></a>, <a href="#query+templates"><span dir="ltr" lang="en">templates</span></a>, <a href="#query+transcludedin"><span dir="ltr" lang="en">transcludedin</span></a>, <a href="#query+transcodestatus"><span dir="ltr" lang="en">transcodestatus</span></a>, <a href="#query+videoinfo"><span dir="ltr" lang="en">videoinfo</span></a>, <a href="#query+wbentityusage"><span dir="ltr" lang="en">wbentityusage</span></a></dd>
      }}

      its(:type) { is_expected.to eq 'list' }
      its(:description) { is_expected.to eq 'Which properties to get for the queried pages.' }
      its(:vals) { are_expected.to eq [
        {"name"=>"categories", "module"=>"categories"},
        {"name"=>"categoryinfo", "module"=>"categoryinfo"},
        {"name"=>"contributors", "module"=>"contributors"},
        {"name"=>"coordinates", "module"=>"coordinates"},
        {"name"=>"deletedrevisions", "module"=>"deletedrevisions"},
        {"name"=>"duplicatefiles", "module"=>"duplicatefiles"},
        {"name"=>"extlinks", "module"=>"extlinks"},
        {"name"=>"extracts", "module"=>"extracts"},
        {"name"=>"fileusage", "module"=>"fileusage"},
        {"name"=>"flagged", "module"=>"flagged"},
        {"name"=>"globalusage", "module"=>"globalusage"},
        {"name"=>"imageinfo", "module"=>"imageinfo"},
        {"name"=>"images", "module"=>"images"},
        {"name"=>"info", "module"=>"info"},
        {"name"=>"iwlinks", "module"=>"iwlinks"},
        {"name"=>"langlinks", "module"=>"langlinks"},
        {"name"=>"links", "module"=>"links"},
        {"name"=>"linkshere", "module"=>"linkshere"},
        {"name"=>"mapdata", "module"=>"mapdata"},
        {"name"=>"pageassessments", "module"=>"pageassessments"},
        {"name"=>"pageimages", "module"=>"pageimages"},
        {"name"=>"pageprops", "module"=>"pageprops"},
        {"name"=>"pageterms", "module"=>"pageterms"},
        {"name"=>"pageviews", "module"=>"pageviews"},
        {"name"=>"redirects", "module"=>"redirects"},
        {"name"=>"references", "module"=>"references"},
        {"name"=>"revisions", "module"=>"revisions"},
        {"name"=>"stashimageinfo", "module"=>"stashimageinfo"},
        {"name"=>"templates", "module"=>"templates"},
        {"name"=>"transcludedin", "module"=>"transcludedin"},
        {"name"=>"transcodestatus", "module"=>"transcodestatus"},
        {"name"=>"videoinfo", "module"=>"videoinfo"},
        {"name"=>"wbentityusage", "module"=>"wbentityusage"}
      ]}
    end

    context 'with prefix' do
      subject(:param) { described_class.from_html_nodes(name, dds, prefix: 'foo') }

      let(:name) { 'footest' }

      let(:source) {%Q{
        <dd class="description"><p>The full filter text to check for a match.</p></dd>
        <dd class="info">This parameter is required.</dd>
      }}

      its(:name) { is_expected.to eq 'test' }
      its(:prefix) { is_expected.to eq 'foo' }
    end
  end

  describe '#to_method' do
    subject { param.to_method(api) }

    let(:api) { instance_double('MediaWiktory::ApiParser::Api') }
    let(:full_name) { prefix + name  }
    let(:name) { 'test' }
    let(:prefix) { '' }
    let(:description) { 'Foobar.' }
    let(:type) { 'string' }
    let(:vals) { nil }
    let(:param) { described_class.new(full_name: full_name, name: name, prefix: prefix, description: description, type: type, vals: vals) }

    context 'simple' do
      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [String]
        |  # @return [self]
        |  def test(value)
        |    merge(test: value.to_s)
        |  end
      }.unindent }
    end

    context 'simple prefixed' do
      let(:prefix) { 'foo' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [String]
        |  # @return [self]
        |  def test(value)
        |    merge(footest: value.to_s)
        |  end
      }.unindent }
    end

    context 'boolean' do
      let(:type) { 'boolean' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [true, false]
        |  # @return [self]
        |  def test(value = true)
        |    merge(test: 'true') if value
        |  end
      }.unindent }
    end

    context 'integer' do
      let(:type) { 'integer' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [Integer]
        |  # @return [self]
        |  def test(value)
        |    merge(test: value.to_s)
        |  end
      }.unindent }
    end

    context 'integer or max' do
      let(:type) { 'integer or max' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [Integer, "max"]
        |  # @return [self]
        |  def test(value)
        |    merge(test: value.to_s)
        |  end
      }.unindent }
    end

    context 'enum' do
      let(:type) { 'enum' }
      let(:vals) { %w[foo bar baz] }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param value [String] One of "foo", "bar", "baz".
        |  # @return [self]
        |  def test(value)
        |    merge(test: value.to_s)
        |  end
      }.unindent }
    end

    context 'list' do
      let(:type) { 'list' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param values [Array<String>]
        |  # @return [self]
        |  def test(*values)
        |    merge(test: values.join('|'))
        |  end
      }.unindent }
    end

    context 'list of integers' do
      let(:type) { 'list of integers' }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param values [Array<Integer>]
        |  # @return [self]
        |  def test(*values)
        |    merge(test: values.join('|'))
        |  end
      }.unindent }
    end

    context 'list of predefined values' do
      let(:type) { 'list' }
      let(:vals) { %w[foo bar baz] }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param values [Array<String>] Allowed values: "foo", "bar", "baz".
        |  # @return [self]
        |  def test(*values)
        |    merge(test: values.join('|'))
        |  end
      }.unindent }
    end

    context 'list of predefined values - with docs' do
      let(:type) { 'list' }
      let(:vals) { [
        {name: 'foo', description: 'Foo'},
        {name: 'bar', description: 'The Bar.'},
        {name: 'baz', description: 'Pretty baz.'}
      ] }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # @param values [Array<String>] Allowed values: "foo" (Foo), "bar" (The Bar), "baz" (Pretty baz).
        |  # @return [self]
        |  def test(*values)
        |    merge(test: values.join('|'))
        |  end
      }.unindent }
    end

    context 'enum - other modules' do
      let(:type) { 'enum' }
      let(:vals) { [{name: 'foo', module: 'foo'}] }
      let(:mod) {
        MediaWiktory::ApiParser::Module.new(
          name: 'mod',
          description: 'Descr of mod',
          params: [
            MediaWiktory::ApiParser::Param.new(name: 'param1', type: 'string', description: 'Descr of param1.'),
            MediaWiktory::ApiParser::Param.new(name: 'param2', type: 'enum', description: 'Descr of param2.', vals: %w[param1a param2a param3a])
          ]
        )
      }
      before { expect(api).to receive(:modules).and_return('foo' => mod).twice }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # Supported options and their settings:
        |  #
        |  #  * `:mod` (Descr of mod):
        |  #    * param1 (String) Descr of param1.
        |  #    * param2 (String) Descr of param2. One of "param1a", "param2a", "param3a".
        |  #
        |  # @param value [Symbol, Hash] Either symbol of selected option, or `{symbol: settings}` Hash.
        |  # @return [self]
        |  def test(value)
        |    merge(test: module_to_hash(value, [:mod]))
        |  end
      }.unindent }
    end

    context 'list - other modules' do
      let(:type) { 'list' }
      let(:vals) { [{name: 'foo', module: 'foo'}] }
      let(:mod) {
        MediaWiktory::ApiParser::Module.new(
          name: 'mod',
          description: 'Descr of mod',
          params: [
            MediaWiktory::ApiParser::Param.new(name: 'param1', type: 'string', description: 'Descr of param1.'),
            MediaWiktory::ApiParser::Param.new(name: 'param2', type: 'enum', description: 'Descr of param2.', vals: %w[param1a param2a param3a])
          ]
        )
      }
      before { expect(api).to receive(:modules).and_return('foo' => mod).twice }

      it { is_expected.to eq %Q{
        |  # Foobar.
        |  #
        |  # Supported options and their settings:
        |  #
        |  #  * `:mod` (Descr of mod):
        |  #    * param1 (String) Descr of param1.
        |  #    * param2 (String) Descr of param2. One of "param1a", "param2a", "param3a".
        |  #
        |  # @param values [Array<Symbol, Hash>] Any number of options (either symbol, or `{symbol: settings}` Hash).
        |  # @return [self]
        |  def test(*values)
        |    merge(test: modules_to_hash(values, [:mod]))
        |  end
      }.unindent }
    end
  end
end
