module MediaWiktory
  class Duplicatefiles < MWModule
    symbol :duplicatefiles
    prefix "df"
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :dir, Params::Enum[:ascending, :descending]
    param :localonly, Params::Boolean
  end
end