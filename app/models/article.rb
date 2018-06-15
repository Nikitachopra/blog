class Article < ApplicationRecord

	validates :title, presence: true, uniqueness: { case_sensitive: false }
	has_many :comments, dependent: :destroy
	belongs_to :user
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
