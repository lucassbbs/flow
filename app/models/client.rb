class Client < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :delete_all
  has_one_attached :photo
end
