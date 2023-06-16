Article.delete_all
User.delete_all

users = 100.times.map do |i|
  User.create(email: "u#{i}@example.com", password: '123')
end

articles = users.map do |user|
  Article.create!(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraphs(number: rand(10..20)).join(' '),
    author: user
  )
end
