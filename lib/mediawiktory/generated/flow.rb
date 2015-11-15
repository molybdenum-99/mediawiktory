module MediaWiktory
  class Flow < Action
    symbol :flow
    param :submodule, Params::Module[:"close-open-topic", :"edit-header", :"edit-post", :"edit-title", :"edit-topic-summary", :"lock-topic", :"moderate-post", :"moderate-topic", :"new-topic", :reply, :"undo-edit-header", :"undo-edit-post", :"undo-edit-topic-summary", :"view-header", :"view-post", :"view-post-history", :"view-topic", :"view-topic-history", :"view-topic-summary", :"view-topiclist"]
    param :page, Params::String
    param :token, Params::String
  end
end