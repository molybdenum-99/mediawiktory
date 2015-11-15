module MediaWiktory
  class EditPost < MWModule
    symbol :"edit-post"
    prefix "ep"
    post!
    param :postId, Params::String
    param :prev_revision, Params::String
    param :content, Params::String
    param :format, Params::Enum["html", "wikitext"]
    param :token, Params::String
  end
end