module MediaWiktory
  class Extlinks < MWModule
    symbol :extlinks
    prefix "el"
    param :limit, Params::IntegerOrMax
    param :offset, Params::Integer
    param :protocol, Params::Enum["bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp"]
    param :query, Params::String
    param :expandurl, Params::Boolean
  end
end