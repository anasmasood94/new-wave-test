class Comment < ApplicationRecord
  belongs_to :commentor, class_name: "User", foreign_key: "commentor_id"
  belongs_to :post

  validates_presence_of :comment
end
