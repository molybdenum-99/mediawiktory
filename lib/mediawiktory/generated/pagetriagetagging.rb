module MediaWiktory
  class Pagetriagetagging < MWModule
    symbol :pagetriagetagging
    post!
    param :pageid, Params::Integer
    param :token, Params::String
    param :top, Params::String
    param :bottom, Params::String
    param :deletion, Params::Boolean
    param :note, Params::String
    param :taglist, Params::List[Params::String]
  end
end