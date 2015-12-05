module MediaWiktory
  class Upload < Action
    symbol :upload
    post!
    param :filename, Params::String
    param :comment, Params::String
    param :text, Params::String
    param :watch, Params::Boolean
    param :watchlist, Params::Enum[:watch, :preferences, :nochange]
    param :ignorewarnings, Params::Boolean
    param :file, Params::String
    param :url, Params::String
    param :filekey, Params::String
    param :sessionkey, Params::String
    param :stash, Params::Boolean
    param :filesize, Params::Integer
    param :offset, Params::Integer
    param :chunk, Params::String
    param :async, Params::Boolean
    param :asyncdownload, Params::Boolean
    param :leavemessage, Params::Boolean
    param :statuskey, Params::String
    param :checkstatus, Params::Boolean
    param :token, Params::String
  end
end