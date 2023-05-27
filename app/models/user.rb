class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = ['customer success','head','analista de trafego','analista de midia', 'analista de inbound','designer']
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role, inclusion: { in: ROLES }
  validates :first_name, :last_name, :role, presence: true
  has_many :tasks, dependent: :destroy
end
