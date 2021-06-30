class Item < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :group, optional: true

  validates :name, presence: true
  validates :amount, presence: true
end
