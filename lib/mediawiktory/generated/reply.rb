module MediaWiktory
  class Reply < MWModule
    symbol :reply
    prefix "rep"
    post!
    param :replyTo, Params::String
    param :content, Params::String
    param :format, Params::Enum[:html, :wikitext]
    param :token, Params::String
  end
end