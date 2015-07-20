require 'faker'

# Create Posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
  )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
  )
end

# Create Unique Post
unique_title = "This is my unique title"
unique_body = "This is my unique body."
if !Post.exists?({:title => unique_title, :body => unique_body})
  Post.create!(
    title: unique_title,
    body:  unique_body
  )
end

# Create Unique Comment
unique_comment_body = "This is my unique comment body."
if !Comment.exists?({:body => unique_comment_body})
  Comment.create!(
    post: posts.sample,
    body: unique_comment_body
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
