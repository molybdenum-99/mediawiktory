module MediaWiktory
  class Enlist < Action
    symbol :enlist
    post!
    param :subaction, Params::Enum[:add, :remove]
    param :role, Params::Enum[:instructor, :online, :campus, :student]
    param :username, Params::String
    param :userid, Params::Integer
    param :courseid, Params::Integer
    param :reason, Params::String
    param :token, Params::String
  end
end