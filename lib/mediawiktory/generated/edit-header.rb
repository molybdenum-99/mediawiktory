module MediaWiktory
  class EditHeader < MWModule
    symbol :"edit-header"
    prefix "eh"
    post!
    param :prev_revision, Params::String
    param :content, Params::String
    param :format, Params::Enum["html", "wikitext"]
    param :token, Params::String
  end
end