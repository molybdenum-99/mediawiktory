module MediaWiktory
  class Visualeditor < Action
    symbol :visualeditor
    param :page, Params::String
    param :format, Params::Enum[:json, :jsonfm]
    param :paction, Params::Enum[:parse, :metadata, :wikitext, :parsefragment, :getlanglinks]
    param :wikitext, Params::String
    param :section, Params::String
    param :oldid, Params::String
    param :editintro, Params::String
    param :pst, Params::Boolean
  end
end