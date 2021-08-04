# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@comp_1 = Competition.create!(name: "Ironman Triathlon", location: "New York", sport: "running")

@az = @comp_1.teams.create!(hometown: "Phoenix", nickname: "AZ")
@ny = @comp_1.teams.create!(hometown: "New York", nickname: "NY")
@tx = @comp_1.teams.create!(hometown: "Dallas", nickname: "TX")

@plager_1_az = @az.players.create!(name: "Sarah", age: 21)
@plager_2_az = @az.players.create!(name: "Jim", age: 25)

@plager_3_ny = @ny.players.create!(name: "Mike", age: 32)
@plager_4_ny = @ny.players.create!(name: "Jenny", age: 30)

@plager_3_tx = @tx.players.create!(name: "Jared", age: 2)
@plager_4_tx = @tx.players.create!(name: "Nichole", age: 18)
