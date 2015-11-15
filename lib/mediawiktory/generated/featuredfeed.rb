module MediaWiktory
  class Featuredfeed < Action
    symbol :featuredfeed
    param :feedformat, Params::Enum["rss", "atom"]
    param :feed, Params::Enum["potd", "featured", "onthisday"]
    param :language, Params::String
  end
end