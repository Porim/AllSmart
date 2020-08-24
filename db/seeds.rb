# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Kid.destroy_all
AllowedGame.destroy_all
User.destroy_all
puts "creating fake games"
subjects = %w(Math English Biology Science)
difficulty_levels = [1, 2, 3, 4, 5]
age_categories = %w(4-5 5-7)
subjects.each do |subject|
  Game.create(subject: subject, difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20)
end
puts "Finished"
puts "creating 10 fake users with 2 fake kids each"
10.times do 
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.new(first_name: first_name, last_name: last_name, email: Faker::Internet.email, password: ("a".."z").to_a.sample(8))
  user.save
  2.times do
    kid = Kid.create(first_name: Faker::Name.first_name, last_name: last_name, age: [4, 5, 6, 7].sample, user_id: user.id)
    Game.all.each do |game|
      AllowedGame.create(game_id: game.id, kid_id: kid.id)
    end
  end
end
puts "Finished"
