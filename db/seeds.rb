# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Task.destroy_all
Client.destroy_all
Step.destroy_all
User.destroy_all

#User
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

client1 = Client.create(
  name: 'Onodera'
)

client2 = Client.create(
  name: 'Google'
)

client3 = Client.create(
  name: 'Amazon'
)

client4 = Client.create(
  name: 'Avon'
)

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

task1 = Task.create(
  title: 'Criar arte para campanha do feriado',
  description: 'Arte Facebook do Natal',
  status: 'solicitado',
  step_id: step2.id,
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
  status: 'solicitado',
  step_id: step3.id,
  deadline: Date.new(2023, 7, 10),
  archived: false,
  client: client3,
  user: may,
  created_by: lucas.id,
)
