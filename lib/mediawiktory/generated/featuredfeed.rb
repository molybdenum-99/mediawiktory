module MediaWiktory
  class Featuredfeed < MWModule
    symbol :featuredfeed
    param :feedformat, Params::Enum["rss", "atom"]
    param :feed, Params::Enum["potd", "featured", "onthisday"]
    param :language, Params::String
  end
end