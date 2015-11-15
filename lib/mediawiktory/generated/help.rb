module MediaWiktory
  class Help < MWModule
    symbol :help
    param :modules, Params::List[Params::String]
    param :submodules, Params::Boolean
    param :recursivesubmodules, Params::Boolean
    param :wrap, Params::Boolean
    param :toc, Params::Boolean
  end
end