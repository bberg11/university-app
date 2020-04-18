require "faker"

20.times do
  name = Faker::Lorem.sentence
  short_name = name.split.first.upcase
  description = Faker::Lorem.paragraph(sentence_count: 3)

  Course.create(
    name: name,
    short_name: short_name,
    description: description,
  )
end

50.times do
  name = Faker::Name.name
  email = Faker::Internet.free_email(name: name.split.first)
  password = "password"

  Student.create(
    name: name,
    email: email,
    password: password,
  )
end
