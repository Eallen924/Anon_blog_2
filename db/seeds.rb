require 'faker'

# tag = %w{ sonic moist wet crusty girls boys naughty ashy hairy }

# tag.each do |tag|
#   Tag.create('name' => tag)
# end

 
 
 

# 10.times do |post|
#   Post.create('body' => Faker::Lorem.words(10).join(" "), 
#               'author' => Faker::Name.name, 
#               'title' => Faker::Company.catch_phrase)
# end

30.times do
  PostTag.create('post_id' => rand(1..9) , 'tag_id' => rand(1..9))
end
