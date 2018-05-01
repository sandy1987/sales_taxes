puts "### Create Default User ###"

User.create!(email: 'demo@salestaxes.com', password: 'password', password_confirmation: 'password')

puts "###########################"