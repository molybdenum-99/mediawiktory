module MediaWiktory
  class Userdailycontribs < Action
    symbol :userdailycontribs
    param :user, Params::String
    param :daysago, Params::Integer
    param :basetimestamp, Params::Timestamp
  end
end