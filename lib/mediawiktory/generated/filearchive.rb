module MediaWiktory
  class Filearchive < MWModule
    symbol :filearchive
    prefix "fa"
    param :from, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :dir, Params::Enum["ascending", "descending"]
    param :sha1, Params::String
    param :sha1base36, Params::String
    param :prop, Params::List[Params::Enum["sha1", "timestamp", "user", "size", "dimensions", "description", "parseddescription", "mime", "mediatype", "metadata", "bitdepth", "archivename"]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end