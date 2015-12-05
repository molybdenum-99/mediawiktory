module MediaWiktory
  class Revisiondelete < Action
    symbol :revisiondelete
    post!
    param :type, Params::Enum[:revision, :archive, :oldimage, :filearchive, :logging]
    param :target, Params::String
    param :ids, Params::List[Params::String]
    param :hide, Params::List[Params::Enum[:content, :comment, :user]]
    param :show, Params::List[Params::Enum[:content, :comment, :user]]
    param :suppress, Params::Enum[:yes, :no, :nochange]
    param :reason, Params::String
    param :token, Params::String
  end
end