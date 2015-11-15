module MediaWiktory
  class Userdailycontribs < MWModule
    symbol :userdailycontribs
    param :user, Params::String
    param :daysago, Params::Integer
    param :basetimestamp, Params::Timestamp
  end
end