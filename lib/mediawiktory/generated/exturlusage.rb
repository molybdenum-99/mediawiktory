module MediaWiktory
  class Exturlusage < MWModule
    symbol :exturlusage
    prefix: "eu"
    param :prop, Params::List[Params::Enum["ids", "title", "url"]]
    param :offset, Params::Integer
    param :protocol, Params::Enum["bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp"]
    param :query, Params::String
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :limit, Params::IntegerOrMax
    param :expandurl, Params::Boolean
  end
end