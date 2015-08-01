# require 'faker'

# module TagsImporter
#   def self.import
#     2.times do
#       Tag.create    :name   =>  Faker::Commerce.department(1, true)
#     end
#   end
# end

# module PostsImporter
#   def self.import
#     2.times do
#       Post.create   :title    => Faker::Lorem.sentence(1, true),
#                     :content  => Faker::Lorem.sentence(1, true)
#     end
#   end
# end

# TagsImporter.import
# PostsImporter.import

# posts = Post.all
# posts.each do |post| 
#   tags = Tag.all
#   tags.sample.posts << post
# end



tag1 = Tag.create(name: "food")
tag2 = Tag.create(name: "car")
tag3 = Tag.create(name: "destination")
tag4 = Tag.create(name: "travel")

post1 = Post.create(title: "icecream", content: "ice")
post2 = Post.create(title: "toyota", content: "toy")
post3 = Post.create(title: "paris", content: "par")
post4 = Post.create(title: "london", content: "lon")


Posttag.create(post_id: post1.id , tag_id: tag1.id)
Posttag.create(post_id: post2.id , tag_id: tag2.id)
Posttag.create(post_id: post3.id , tag_id: tag4.id)
Posttag.create(post_id: post4.id , tag_id: tag3.id)






