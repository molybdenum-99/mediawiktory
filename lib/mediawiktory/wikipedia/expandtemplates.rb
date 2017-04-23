# Expands all templates within wikitext.
#
# Usage:
#
# ```ruby
# api.expandtemplates(**options).perform # returns string with raw output
# # or
# api.expandtemplates(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.expandtemplates.title(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Expandtemplates < GetAction
  # Title of page.
  #
  # @param value [String]
  # @return [self]
  def title(value)
    merge(title: value.to_s)
  end
  # Wikitext to convert.
  #
  # @param value [String]
  # @return [self]
  def text(value)
    merge(text: value.to_s)
  end
  # Revision ID, for {{REVISIONID}} and similar variables.
  #
  # @param value [Integer]
  # @return [self]
  def revid(value)
    merge(revid: value.to_s)
  end
  # Which pieces of information to get.
Note that if no values are selected, the result will contain the wikitext, but the output will be in a deprecated format.
  #
  # @param values [Array<String>] Allowed values: "wikitext" (The expanded wikitext), "categories" (Any categories present in the input that are not represented in the wikitext output), "properties" (Page properties defined by expanded magic words in the wikitext), "volatile" (Whether the output is volatile and should not be reused elsewhere within the page), "ttl" (The maximum time after which caches of the result should be invalidated), "modules" (Any ResourceLoader modules that parser functions have requested be added to the output. Either jsconfigvars or encodedjsconfigvars must be requested jointly with modules), "jsconfigvars" (Gives the JavaScript configuration variables specific to the page), "encodedjsconfigvars" (Gives the JavaScript configuration variables specific to the page as a JSON string), "parsetree" (The XML parse tree of the input).
  # @return [self]
  def prop(*values)
    merge(prop: values.join('|'))
  end
  # Whether to include HTML comments in the output.
  #
  # @param value [true, false]
  # @return [self]
  def includecomments(value = true)
    merge(includecomments: 'true') if value
  end
  # Generate XML parse tree (replaced by prop=parsetree).
  #
  # @param value [true, false]
  # @return [self]
  def generatexml(value = true)
    merge(generatexml: 'true') if value
  end
  # Template sandbox prefix, as with Special:TemplateSandbox.
  #
  # @param values [Array<String>]
  # @return [self]
  def templatesandboxprefix(*values)
    merge(templatesandboxprefix: values.join('|'))
  end
  # Parse the page using templatesandboxtext in place of the contents of the page named here.
  #
  # @param value [String]
  # @return [self]
  def templatesandboxtitle(value)
    merge(templatesandboxtitle: value.to_s)
  end
  # Parse the page using this page content in place of the page named by templatesandboxtitle.
  #
  # @param value [String]
  # @return [self]
  def templatesandboxtext(value)
    merge(templatesandboxtext: value.to_s)
  end
  # Content model of templatesandboxtext.
  #
  # @param value [String] One of "GadgetDefinition", "SecurePoll", "MassMessageListContent", "JsonSchema", "wikitext", "javascript", "json", "css", "text", "Scribunto".
  # @return [self]
  def templatesandboxcontentmodel(value)
    merge(templatesandboxcontentmodel: value.to_s)
  end
  # Content format of templatesandboxtext.
  #
  # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
  # @return [self]
  def templatesandboxcontentformat(value)
    merge(templatesandboxcontentformat: value.to_s)
  end

end