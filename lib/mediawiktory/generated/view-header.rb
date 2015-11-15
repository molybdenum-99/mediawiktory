module MediaWiktory
  class ViewHeader < MWModule
    symbol :"view-header"
    prefix "vh"
    param :format, Params::Enum["html", "wikitext", "fixed-html"]
    param :revId, Params::String
  end
end