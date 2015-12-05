module MediaWiktory
  class ViewPostHistory < MWModule
    symbol :"view-post-history"
    prefix "vph"
    param :postId, Params::String
    param :format, Params::Enum[:html, :wikitext, :"fixed-html"]
  end
end