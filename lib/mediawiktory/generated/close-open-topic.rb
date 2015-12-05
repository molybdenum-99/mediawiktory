module MediaWiktory
  class CloseOpenTopic < MWModule
    symbol :"close-open-topic"
    prefix "cot"
    post!
    param :moderationState, Params::Enum[:lock, :unlock, :close, :reopen]
    param :reason, Params::String
    param :token, Params::String
  end
end