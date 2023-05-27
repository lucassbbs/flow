class Client < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :destroy
  has_one_attached :photo
end
