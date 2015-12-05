module MediaWiktory
  class Feedrecentchanges < Action
    symbol :feedrecentchanges
    param :feedformat, Params::Enum[:rss, :atom]
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"2300", :"2301", :"2302", :"2303", :"710", :"711", :"446", :"447", :"2600", :"828", :"829"]
    param :invert, Params::Boolean
    param :associated, Params::Boolean
    param :days, Params::Integer
    param :limit, Params::Integer
    param :from, Params::Timestamp
    param :hideminor, Params::Boolean
    param :hidebots, Params::Boolean
    param :hideanons, Params::Boolean
    param :hideliu, Params::Boolean
    param :hidepatrolled, Params::Boolean
    param :hidemyself, Params::Boolean
    param :tagfilter, Params::String
    param :target, Params::String
    param :showlinkedto, Params::Boolean
  end
end