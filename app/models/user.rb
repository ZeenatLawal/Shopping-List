class User < ApplicationRecord
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, foreign_key: 'author_id'
  has_many :groups

  mount_uploader :profile_icon, IconUploader

  validates :name, presence: true

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['lower(name) = :value OR lower(email) = :value',
       { value: login.strip.downcase }]
    ).first
  end
end
