# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Event.create(name:'Evento-teste1', description:'Esse é o evento teste 1', facilitator:'SET', kind:'mini-curso', price:20).schedules.create(start_time:DateTime.new(2016,5,9,10,30), end_time:DateTime.new(2016,6,9,12,30))
Event.create(name:'Evento-teste2', description:'Esse é o evento teste 2', facilitator:'SET', kind:'mini-curso', price:20).schedules.create(start_time:DateTime.new(2016,7,9,10,30), end_time:DateTime.new(2016,7,9,12,30))
Event.create(name:'Evento-teste3', description:'Esse é o evento teste 3', facilitator:'SET', kind:'palestra', price:45).schedules.create(start_time:DateTime.new(2016,5,9,14,30), end_time:DateTime.new(2016,6,9,16,30))
Event.create(name:'Evento-teste4', description:'Esse é o evento teste 4', facilitator:'SET', kind:'palestra', price:45).schedules.create(start_time:DateTime.new(2016,7,9,14,30), end_time:DateTime.new(2016,6,9,16,30))
Event.create(name:'Evento-teste5', description:'Esse é o evento teste 5', facilitator:'SET', kind:'mini-curso', price:20).schedules.create(start_time:DateTime.new(2016,8,9,10,30), end_time:DateTime.new(2016,6,9,12,30))
Event.create(name:'Evento-teste6', description:'Esse é o evento teste 6', facilitator:'SET', kind:'palestra', price:45).schedules.create(start_time:DateTime.new(2016,8,9,14,30), end_time:DateTime.new(2016,6,9,16,30))
Event.create(name:'Evento-teste7', description:'Esse é o evento teste 7', facilitator:'SET', kind:'visita', price:35).schedules.create(start_time:DateTime.new(2016,6,9,10,30), end_time:DateTime.new(2016,6,9,12,30))
Event.create(name:'Evento-teste8', description:'Esse é o evento teste 8', facilitator:'SET', kind:'visita', price:35).schedules.create(start_time:DateTime.new(2016,6,9,14,30), end_time:DateTime.new(2016,6,9,16,30))

Package.create(title:'Ouro', description:'esse é o pacote ouro', limit:20, price:50, courses:4, lectures:3, visits:2)
Package.create(title:'Prata', description:'esse é o pacote ouro', limit:20, price:40, courses:3, lectures:2, visits:1)
Package.create(title:'Bronze', description:'esse é o pacote ouro', limit:20, price:30, courses:2, lectures:1, visits:0)


#30.times do
 # FactoryGirl.create :event
#end