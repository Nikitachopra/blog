class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :avatar
  has_many :comments
end
