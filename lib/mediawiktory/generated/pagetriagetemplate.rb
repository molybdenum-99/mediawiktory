module MediaWiktory
  class Pagetriagetemplate < MWModule
    symbol :pagetriagetemplate
    param :view, Params::String
    param :template, Params::String
  end
end