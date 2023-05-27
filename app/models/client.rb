class Client < ApplicationRecord
  validates :name, presence: true
  has_many :tasks, dependent: :destroy
end
