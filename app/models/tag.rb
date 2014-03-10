class Tag < ActiveRecord::Base
  has_many :reverse_relationships, class_name: "Relationships", dependent: :destroy

  has_many :posts, through: :reverse_relationships
end
