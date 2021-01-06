puts "starting seed"

User.destroy_all

charles = User.create(email: "charles@gmail.com", password: "123456")
computer = User.create(email: "computer@gmail.com", password: "123456")

puts "seed finished"
