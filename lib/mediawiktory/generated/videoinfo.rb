module MediaWiktory
  class Videoinfo < MWModule
    symbol :videoinfo
    prefix "vi"
    param :prop, Params::List[Params::Enum[:timestamp, :user, :userid, :comment, :parsedcomment, :canonicaltitle, :url, :size, :dimensions, :sha1, :mime, :thumbmime, :mediatype, :metadata, :commonmetadata, :extmetadata, :archivename, :bitdepth, :uploadwarning, :derivatives]]
    param :limit, Params::IntegerOrMax
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :urlwidth, Params::Integer
    param :urlheight, Params::Integer
    param :urlparam, Params::String
    param :continue, Params::String
  end
end