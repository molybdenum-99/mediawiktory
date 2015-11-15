module MediaWiktory
  class ViewPost < MWModule
    symbol :"view-post"
    prefix "vp"
    param :postId, Params::String
    param :format, Params::Enum["html", "wikitext", "fixed-html"]
  end
end