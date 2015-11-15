module MediaWiktory
  class ViewTopicHistory < MWModule
    symbol :"view-topic-history"
    prefix "vth"
    param :format, Params::Enum["html", "wikitext", "fixed-html"]
  end
end