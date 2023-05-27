class Task < ApplicationRecord
  STATUS = ['solicitado','aprovado','concluído','em andamento','em aprovação','pendente','refação']
  STEPS = ['backlog', 'customer success', 'copy writing', 'design', 'mídia', 'inbound', 'performance']
  validates :title, :status, :client_id, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :step, inclusion: { in: STEPS }
  belongs_to :user
  belongs_to :client
  has_one_attached :photo
end
