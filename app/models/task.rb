class Task < ApplicationRecord
  #STATUS = ['solicitado','aprovado','concluído','em andamento','em aprovação','pendente','refação']
  #STEPS = ['backlog', 'customer success', 'copy writing', 'design', 'mídia', 'inbound', 'performance']
  validates :title, :status, :client_id, presence: true
  #validates :status, inclusion: { in: STATUS }
  #validates :step, inclusion: { in: STEPS }
  belongs_to :user
  belongs_to :client
  has_one_attached :photo

  enum steps: {
    backlog: "Backlog",
    customer_success: "Customer Success",
    "copy_writing" => "Copy",
    design: "Design",
    mídia: "Mídia",
    inbound: "Inbound",
    performance: "Performance"
  }

  enum step_color: {
    backlog_color: "#ED2E19",
    customer_success_color: "#A027A3",
    copy_writing_color: "#460047",
    design_color: "#262487",
    mídia_color: "#2739FF",
    inbound_color: "#6F7AF7",
    performance_color: "#ED776A"
  }

  def self.test
    users_id = self.all.pluck(:user_id)
    names = []
    users_id.each do |user_id|
      names << User.find(user_id).first_name
    end
    users_id.zip(names).map {|a, b| [b, a]}
  end

end
