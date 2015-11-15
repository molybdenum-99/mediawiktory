module MediaWiktory
  class Help < Action
    symbol :help
    param :modules, Params::List[Params::String]
    param :submodules, Params::Boolean
    param :recursivesubmodules, Params::Boolean
    param :wrap, Params::Boolean
    param :toc, Params::Boolean
  end
end