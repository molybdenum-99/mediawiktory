module MediaWiktory
  class Siteviews < MWModule
    symbol :siteviews
    prefix "pvis"
    param :metric, Params::Enum[:pageviews, :uniques]
    param :days, Params::Integer
  end
end