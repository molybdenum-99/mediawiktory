module MediaWiktory
  class Import < Action
    symbol :import
    post!
    param :summary, Params::String
    param :xml, Params::String
    param :interwikisource, Params::Enum[:meta, :nost, :de, :es, :fr, :it, :pl, :outreachwiki, :test2wiki]
    param :interwikipage, Params::String
    param :fullhistory, Params::Boolean
    param :templates, Params::Boolean
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"2300", :"2301", :"2302", :"2303", :"710", :"711", :"446", :"447", :"2600", :"828", :"829"]
    param :rootpage, Params::String
    param :token, Params::String
  end
end