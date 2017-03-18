module MediaWiktory
  class Search < MWModule
    symbol :search
    prefix "sr"
    param :search, Params::String
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]]
    param :limit, Params::IntegerOrMax
    param :offset, Params::Integer
    param :qiprofile, Params::Enum[:classic, :classic_noboostlinks, :empty, :wsum_inclinks, :wsum_inclinks_pv, :popular_inclinks_pv, :popular_inclinks]
    param :what, Params::Enum[:title, :text, :nearmatch]
    param :info, Params::List[Params::Enum[:totalhits, :suggestion, :rewrittenquery]]
    param :prop, Params::List[Params::Enum[:size, :wordcount, :timestamp, :snippet, :titlesnippet, :redirecttitle, :redirectsnippet, :sectiontitle, :sectionsnippet, :isfilematch, :categorysnippet, :score, :hasrelated]]
    param :interwiki, Params::Boolean
    param :enablerewrites, Params::Boolean
  end
end