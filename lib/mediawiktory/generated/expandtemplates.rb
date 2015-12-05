module MediaWiktory
  class Expandtemplates < Action
    symbol :expandtemplates
    param :title, Params::String
    param :text, Params::String
    param :revid, Params::Integer
    param :prop, Params::List[Params::Enum[:wikitext, :categories, :properties, :volatile, :ttl, :modules, :jsconfigvars, :encodedjsconfigvars, :parsetree]]
    param :includecomments, Params::Boolean
    param :generatexml, Params::Boolean
  end
end