# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Task.destroy_all
Client.destroy_all
Step.destroy_all
User.destroy_all

# User
augusto = User.create!(
  first_name: "Augusto",
  last_name: "Medeiros",
  email: "augusto@mail.com",
  password: '123456',
  role: "customer success"
)

lucas = User.create!(
  first_name: "Lucas",
  last_name: "Souza",
  email: "lucas@mail.com",
  password: '123456',
  role: "head"
)

pedro = User.create!(
  first_name: "Pedro",
  last_name: "Abreu",
  email: "pedro@mail.com",
  password: '123456',
  role: "designer"
)

may = User.create!(
  first_name: "Mayara",
  last_name: "Vass",
  email: "may@mail.com",
  password: '123456',
  role: "analista de trafego"
)

# Client
file = URI.open("https://hotsites.pagolivre.com.br/Onodera-GiftCard/assets/images/Logo.jpg")
client1 = Client.new(
  name: 'Onodera'
)
client1.photo.attach(io: file, filename: "onodera.png", content_type: "image/png")
client1.save

file = URI.open("https://blog.hubspot.com/hubfs/image8-2.jpg")
client2 = Client.new(
  name: 'Google'
)
client2.photo.attach(io: file, filename: "google.png", content_type: "image/png")
client2.save

file = URI.open("https://www.shutterstock.com/image-photo/montreal-canada-february-28-2017-260nw-590095607.jpg")
client3 = Client.new(
name: 'Amazon'
)
client3.photo.attach(io: file, filename: "amazon.png", content_type: "image/png")
client3.save

file = URI.open("https://1000logos.net/wp-content/uploads/2016/10/Avon-logo.jpg")
client4 = Client.new(
  name: 'Avon'
)
client4.photo.attach(io: file, filename: "avon.png", content_type: "image/png")
client4.save

client5 = Client.create(
  name: 'Sadia'
)

# Step
step1 = Step.create(
  name: 'Backlog',
  color: '#ED2E19',
  user_id: may.id,
  index: 1
)

step2 = Step.create(
  name: 'Customer Success',
  color: '#A027A3',
  user_id: pedro.id,
  index: 2
)

step3 = Step.create(
  name: 'Copy',
  color: '#460047',
  user_id: augusto.id,
  index: 3
)

step4 = Step.create(
  name: 'Design',
  color: '#262487',
  user_id: lucas.id,
  index: 4
)

step5 = Step.create(
  name: 'Mídia',
  color: '#2739FF',
  user_id: may.id,
  index: 5
)

step6 = Step.create(
  name: 'Inbound',
  color: '#6F7AF7',
  user_id: pedro.id,
  index: 6
)

step7 = Step.create(
  name: 'Performance',
  color: '#ED776A',
  user_id: augusto.id,
  index: 7
)

# Task
task1 = Task.create(
  title: 'Criar arte para campanha do feriado',
  description: 'Arte Facebook do Natal',
  status: 'em andamento',
  step_id: step4.id,
  deadline: Date.new(2023, 7, 10),
  archived: false,
  client: client1,
  user: pedro,
  created_by: lucas.id,
)

task2 = Task.create(
  title: 'Campanha de divugação da API',
  description: 'API Zoan',
  status: 'solicitado',
  step_id: step4.id,
  deadline: Date.new(2023, 7, 10),
  archived: false,
  client: client2,
  user: augusto,
  created_by: lucas.id,
)

task3 = Task.create(
  title: 'Verificar Performace',
  description: 'Campanha do Feriado do Natal',
  status: 'em andamento',
  step_id: step7.id,
  deadline: Date.new(2023, 7, 10),
  archived: false,
  client: client3,
  user: pedro,
  created_by: lucas.id,
)

task4 = Task.create(
  title: 'Enviar contrato para cliente',
  description: 'Pedir para o jurídico o modelo e enviar para cliente.',
  status: 'solicitado',
  step_id: step1.id,
  deadline: Date.new(2023, 6, 24),
  archived: false,
  client: client5,
  user: may,
  created_by: lucas.id,
)

task5 = Task.create(
  title: 'Reunião de kickoff',
  description: 'Alinhar expectativas do projeto',
  status: 'solicitado',
  step_id: step1.id,
  deadline: Date.new(2023, 6, 26),
  archived: false,
  client: client1,
  user: may,
  created_by: lucas.id,
)

task6 = Task.create(
  title: 'Faturar a nova campanha de batom',
  description: 'Visita ao escritório do cliente',
  status: 'solicitado',
  step_id: step1.id,
  deadline: Date.new(2023, 6, 28),
  archived: false,
  client: client4,
  user: may,
  created_by: lucas.id,
)

task7 = Task.create(
  title: 'Kickoff campanha de perfumes',
  description: '',
  status: 'em andamento',
  step_id: step2.id,
  deadline: Date.new(2023, 6, 28),
  archived: false,
  client: client4,
  user: may,
  created_by: lucas.id,
)

task8 = Task.create(
  title: 'Problema no pagamento',
  description: 'Parâmetro de pagamento errado já corrigido',
  status: 'concluído',
  step_id: step2.id,
  deadline: Date.new(2023, 6, 28),
  archived: false,
  client: client2,
  user: may,
  created_by: lucas.id,
)

task9 = Task.create(
  title: 'Envio da campanha para redes sociais',
  description: 'aprovação da campanha',
  status: 'em aprovação',
  step_id: step5.id,
  deadline: Date.new(2023, 6, 17),
  archived: false,
  client: client4,
  user: augusto,
  created_by: lucas.id,
)

task9 = Task.create(
  title: 'Análise de copy',
  description: 'Avaliar direitos autorais e copy',
  status: 'refação',
  step_id: step3.id,
  deadline: Date.new(2023, 6, 17),
  archived: false,
  client: client2,
  user: augusto,
  created_by: lucas.id,
)
