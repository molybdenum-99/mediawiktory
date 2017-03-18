module MediaWiktory
  class SanitizeMapdata < Action
    symbol :"sanitize-mapdata"
    post!
    param :title, Params::String
    param :text, Params::String
  end
end