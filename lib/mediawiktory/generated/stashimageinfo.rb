module MediaWiktory
  class Stashimageinfo < MWModule
    symbol :stashimageinfo
    prefix "sii"
    param :filekey, Params::List[Params::String]
    param :sessionkey, Params::List[Params::String]
    param :prop, Params::List[Params::Enum[:timestamp, :canonicaltitle, :url, :size, :dimensions, :sha1, :mime, :thumbmime, :metadata, :commonmetadata, :extmetadata, :bitdepth]]
    param :urlwidth, Params::Integer
    param :urlheight, Params::Integer
    param :urlparam, Params::String
  end
end