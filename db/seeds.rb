puts "starting seed"

User.destroy_all

charles = User.create(email: "ch.boyeldieu@gmail.com", password: "123456")

puts "seed finished"
