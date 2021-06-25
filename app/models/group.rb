class Group < ApplicationRecord
  belongs_to :user
  has_many :items

  mount_uploader :icon, IconUploader

  validates :name, presence: true
  validates :icon, presence: true
end
