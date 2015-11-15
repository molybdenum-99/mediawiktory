module MediaWiktory
  class Gettingstartedgetpages < MWModule
    symbol :gettingstartedgetpages
    prefix: "gsgp"
    param :taskname, Params::String
    param :excludedtitle, Params::String
    param :count, Params::Integer
  end
end