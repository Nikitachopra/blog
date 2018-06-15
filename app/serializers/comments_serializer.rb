class CommentsSerializer < ActiveModel::Serializer
  attributes :id, :commenter, :body
  has_one :article
end
