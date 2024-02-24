100.times.with_index do
  post = Post.create(
    title: Faker::Lorem.sentence(word_count: 3),
    body:  Faker::Lorem.paragraph(sentence_count: 3),
  )
  puts post.title
end
