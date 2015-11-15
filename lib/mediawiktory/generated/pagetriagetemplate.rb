module MediaWiktory
  class Pagetriagetemplate < Action
    symbol :pagetriagetemplate
    param :view, Params::String
    param :template, Params::String
  end
end