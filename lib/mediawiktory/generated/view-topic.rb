module MediaWiktory
  class ViewTopic < MWModule
    symbol :"view-topic"
    prefix: "vt"
    param :format, Params::Enum["html", "wikitext", "fixed-html"]
  end
end