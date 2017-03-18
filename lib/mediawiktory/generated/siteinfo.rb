module MediaWiktory
  class Siteinfo < MWModule
    symbol :siteinfo
    prefix "si"
    param :prop, Params::List[Params::Enum[:general, :namespaces, :namespacealiases, :specialpagealiases, :magicwords, :interwikimap, :dbrepllag, :statistics, :usergroups, :libraries, :extensions, :fileextensions, :rightsinfo, :restrictions, :languages, :languagevariants, :skins, :extensiontags, :functionhooks, :showhooks, :variables, :protocols, :defaultoptions, :uploaddialog]]
    param :filteriw, Params::Enum[:local, :"!local"]
    param :showalldb, Params::Boolean
    param :numberingroup, Params::Boolean
    param :inlanguagecode, Params::String
  end
end