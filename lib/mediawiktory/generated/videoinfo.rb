module MediaWiktory
  class Videoinfo < MWModule
    symbol :videoinfo
    prefix "vi"
    param :prop, Params::List[Params::Enum[:timestamp, :user, :userid, :comment, :parsedcomment, :canonicaltitle, :url, :size, :dimensions, :sha1, :mime, :thumbmime, :mediatype, :metadata, :commonmetadata, :extmetadata, :archivename, :bitdepth, :uploadwarning, :badfile, :derivatives, :timedtext]]
    param :limit, Params::IntegerOrMax
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :urlwidth, Params::Integer
    param :urlheight, Params::Integer
    param :metadataversion, Params::String
    param :extmetadatalanguage, Params::String
    param :extmetadatamultilang, Params::Boolean
    param :extmetadatafilter, Params::List[Params::String]
    param :urlparam, Params::String
    param :badfilecontexttitle, Params::String
    param :continue, Params::String
    param :localonly, Params::String
  end
end