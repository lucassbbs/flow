class Client < ApplicationRecord
  validates :name, presence: true
end
