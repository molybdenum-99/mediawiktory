module MediaWiktory
  class Mobileview < Action
    symbol :mobileview
    param :page, Params::String
    param :redirect, Params::Enum["yes", "no"]
    param :sections, Params::String
    param :prop, Params::List[Params::Enum["text", "sections", "normalizedtitle", "lastmodified", "lastmodifiedby", "revision", "protection", "editable", "languagecount", "hasvariants", "displaytitle", "pageprops"]]
    param :sectionprop, Params::List[Params::Enum["toclevel", "level", "line", "number", "index", "fromtitle", "anchor"]]
    param :pageprops, Params::String
    param :variant, Params::String
    param :noimages, Params::Boolean
    param :noheadings, Params::Boolean
    param :notransform, Params::Boolean
    param :onlyrequestedsections, Params::Boolean
    param :offset, Params::Integer
    param :maxlen, Params::Integer
    param :thumbheight, Params::Integer
    param :thumbwidth, Params::Integer
    param :thumbsize, Params::Integer
  end
end