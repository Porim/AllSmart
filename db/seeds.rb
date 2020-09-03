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
subjects = %w(Maths English Biology Science)
difficulty_levels = [1, 2, 3, 4, 5]
age_categories = %w(4-5 5-6 6-7)

math_topics = ['Shapes', 'Addition', 'Multiplication', 'Substraction', 'Division']
science_topics = ['Solar System', 'Magnetism', 'Forces', 'Explosive mixology', 'Electricity']
biology_topics = ['Cardiovascular system', 'Organs', 'Muscles', 'Senses']
english_topics =['Vowels', 'Rhymes', 'Reading' ]

math_titles = ['Find the right shape', 'Addition sprint', 'Lets multiply!', 'Tricky minus', 'Divide and conquer']
science_titles = ['Where we live', 'How do magnets work?', 'Move that block', 'Boom!', 'Zap, and it works!']
biology_titles = ['Where is your heart?', 'How we work', 'Flex the muscle', 'How do we feel?']
english_titles = ['Vowels are wow', 'Rhyme it', 'Reading ready?']

maths_img = ['triangle_lgksmb', 'board_n4mwck', 'mathematics_ut3trh', 'minus_edbjg7', 'division_ovbc0v']
science_img = ['universe_scx81t', 'magnet_adb8wr', 'force_yhvgwa', 'explosion_nypkai', 'energy_rzyips']
biology_img = ['heart_jgrctf', 'stomach_ttx12e', 'muscle_aitput', 'nervous-system_phgh4s']
english_img = ['alphabet_fq8qah', 'poem_lqklwp', 'abc_qmratk'] 
topic_img = {maths: 'medolwcf6nigmrl3cvev', science: 'rnrgntaicfrllbnrzlxg', biology: 'enssmizahvyzkryyufw0', english: 'dkbxbzo5dpzzf0o3kbgy'}
index = 0

(0..math_topics.length - 1).each do |idx|
  Game.create(subject: 'Maths', difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20, title:math_titles[idx], topic: math_topics[idx], cloud_imag_url: maths_img[idx], topic_image_url: topic_img[:maths] )
end

(0..science_topics.length - 1).each do |idx|
  Game.create(subject: 'Science', difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20, title:science_titles[idx], topic: science_topics[idx], cloud_imag_url: science_img[idx], topic_image_url: topic_img[:science] )
end

(0..biology_topics.length - 1).each do |idx|
  Game.create(subject: 'Biology', difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20, title:biology_titles[idx], topic: biology_topics[idx], cloud_imag_url: biology_img[idx], topic_image_url: topic_img[:biology] )
end

(0..english_topics.length - 1).each do |idx|
  Game.create(subject: 'English', difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20, title:english_titles[idx], topic: english_topics[idx], cloud_imag_url: english_img[idx], topic_image_url: topic_img[:english])
end

# subjects.each do |subject|
#   Game.create(subject: subject, difficulty_level: difficulty_levels.sample, age_category: age_categories.sample, base_score: 20, title:titles[index] )
#   index += 1
# end


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
puts 'Creating test user with kids and games'

me = User.create(first_name: 'Nikita', last_name: 'Visencuk', email: 'nikita@visencuk.com', password: '123456')
test_kids = [Kid.create(first_name: 'Paul', last_name: 'Visencuk', age: [4, 5, 6, 7].sample, user: me), Kid.create(first_name: 'Anne', last_name: 'Visencuk', age: [4, 5, 6, 7].sample, user: me)]

test_kids.each do |kid|
  Game.all.each do |game|
      AllowedGame.create(game_id: game.id, kid: kid)
    end
end
puts "Finished"


