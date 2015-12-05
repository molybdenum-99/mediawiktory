module MediaWiktory
  class Lists < MWModule
    symbol :lists
    prefix "lst"
    param :mode, Params::Enum[:allpublic, :allhidden, :review]
    param :prop, Params::List[Params::Enum[:label, :description, :public, :perm, :perm_override, :flagged, :hidden, :review, :image, :count, :updated, :owner]]
    param :minitems, Params::Integer
    param :ids, Params::List[Params::Integer]
    param :title, Params::String
    param :owner, Params::String
    param :token, Params::String
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end