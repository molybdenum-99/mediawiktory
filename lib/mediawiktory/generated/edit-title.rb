module MediaWiktory
  class EditTitle < MWModule
    symbol :"edit-title"
    prefix: "et"
    post!
    param :prev_revision, Params::String
    param :content, Params::String
    param :token, Params::String
  end
end