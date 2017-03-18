module MediaWiktory
  class Expandtemplates < Action
    symbol :expandtemplates
    param :title, Params::String
    param :text, Params::String
    param :revid, Params::Integer
    param :prop, Params::List[Params::Enum[:wikitext, :categories, :properties, :volatile, :ttl, :modules, :jsconfigvars, :encodedjsconfigvars, :parsetree]]
    param :includecomments, Params::Boolean
    param :generatexml, Params::Boolean
    param :templatesandboxprefix, Params::List[Params::String]
    param :templatesandboxtitle, Params::String
    param :templatesandboxtext, Params::String
    param :templatesandboxcontentmodel, Params::Enum[:GadgetDefinition, :SecurePoll, :MassMessageListContent, :JsonSchema, :wikitext, :javascript, :json, :css, :text, :Scribunto]
    param :templatesandboxcontentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
  end
end