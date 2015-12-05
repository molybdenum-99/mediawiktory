module MediaWiktory
  class Filerepoinfo < MWModule
    symbol :filerepoinfo
    prefix "fri"
    param :prop, Params::List[Params::Enum[:apiurl, :name, :displayname, :rooturl, :local]]
  end
end