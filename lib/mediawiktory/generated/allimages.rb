module MediaWiktory
  class Allimages < MWModule
    symbol :allimages
    prefix "ai"
    param :sort, Params::Enum[:name, :timestamp]
    param :dir, Params::Enum[:ascending, :descending, :newer, :older]
    param :from, Params::String
    param :to, Params::String
    param :continue, Params::String
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :prop, Params::List[Params::Enum[:timestamp, :user, :userid, :comment, :parsedcomment, :canonicaltitle, :url, :size, :dimensions, :sha1, :mime, :mediatype, :metadata, :commonmetadata, :extmetadata, :bitdepth]]
    param :prefix, Params::String
    param :minsize, Params::Integer
    param :maxsize, Params::Integer
    param :sha1, Params::String
    param :sha1base36, Params::String
    param :user, Params::String
    param :filterbots, Params::Enum[:all, :bots, :nobots]
    param :mime, Params::List[Params::String]
    param :limit, Params::IntegerOrMax
  end
end