module MediaWiktory
  class Parse < Action
    symbol :parse
    param :title, Params::String
    param :text, Params::String
    param :summary, Params::String
    param :page, Params::String
    param :pageid, Params::Integer
    param :redirects, Params::Boolean
    param :oldid, Params::Integer
    param :prop, Params::List[Params::Enum[:text, :langlinks, :categories, :categorieshtml, :links, :templates, :images, :externallinks, :sections, :revid, :displaytitle, :headitems, :headhtml, :modules, :jsconfigvars, :encodedjsconfigvars, :indicators, :iwlinks, :wikitext, :properties, :limitreportdata, :limitreporthtml, :parsetree]]
    param :pst, Params::Boolean
    param :onlypst, Params::Boolean
    param :effectivelanglinks, Params::Boolean
    param :section, Params::String
    param :sectiontitle, Params::String
    param :disablepp, Params::Boolean
    param :disablelimitreport, Params::Boolean
    param :disableeditsection, Params::Boolean
    param :disabletidy, Params::Boolean
    param :generatexml, Params::Boolean
    param :preview, Params::Boolean
    param :sectionpreview, Params::Boolean
    param :disabletoc, Params::Boolean
    param :contentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
    param :contentmodel, Params::Enum[:GadgetDefinition, :SecurePoll, :MassMessageListContent, :JsonSchema, :wikitext, :javascript, :json, :css, :text, :Scribunto]
    param :mobileformat, Params::Boolean
    param :noimages, Params::Boolean
    param :mainpage, Params::Boolean
    param :templatesandboxprefix, Params::List[Params::String]
    param :templatesandboxtitle, Params::String
    param :templatesandboxtext, Params::String
    param :templatesandboxcontentmodel, Params::Enum[:GadgetDefinition, :SecurePoll, :MassMessageListContent, :JsonSchema, :wikitext, :javascript, :json, :css, :text, :Scribunto]
    param :templatesandboxcontentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
  end
end