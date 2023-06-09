class Task < ApplicationRecord
  #STATUS = ['Solicitado','Aprovado','Concluído','Em andamento','Em aprovação','Pendente','Refação']
  #STEPS = ['Backlog', 'Customer Success', 'Copy Writing', 'Design', 'Mídia', 'Inbound', 'Performance']
  validates :title, :status, :client_id, :deadline, presence: true
  #validates :status, inclusion: { in: STATUS }
  #validates :step, inclusion: { in: STEPS }
  belongs_to :user
  belongs_to :client
  belongs_to :step
  has_one_attached :photo

  def self.test
    users_id = self.all.pluck(:user_id)
    names = []
    users_id.each do |user_id|
      names << User.find(user_id).first_name
    end
    users_id.zip(names).map {|a, b| [b, a]}
  end

end
