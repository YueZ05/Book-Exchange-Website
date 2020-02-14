# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

#ADMIN
 User.create!(name:  "Admin",
             email: "admin.1@osu.edu",
             password:              "Foobar1!",
              password_confirmation: "Foobar1!",
              admin: true)

#SAMPLE USERS
6.times do |n|
  name  = Faker::Name.name
  email = "example.#{n+1}@osu.edu"
  password = "Foobar1!"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password
               )
end




#SAMPLE BOOKS
40.times do |m|
  title=Faker::Book.title
  author=Faker::Book.author
  des=Faker::Lorem.sentence(5)
  sale=Faker::Boolean.boolean
  quantity=Faker::Number.non_zero_digit
  book_info=[["CSE 3901", "Ruby on Rails Tutorial","9443757127566","Michael Hartl"],
             ["HISTORY 1212", "A brief history of western civilization","4922976332898", "Mark Kishlansky, Patrick Geary, Patricia O'Brien"],
             ["MATH 3345", "Falkner Lecture Notes","1239269797240", "Neil Falkner"],
             ["STAT 3201", "Mathematical Statistics with Applications","3138022138725"," Dennis Wackerly, William Mendenhall"],
             ["ENGLISH 1110", "Writing Analytically","5516147373566", "David Rosenwasser, Jill Stephen"]]
  con=["New", "Used - Like New or Open Box", "Used - Very Good", "Used - Good", "Used - Acceptable"].sample
  price = [12.44, 9.5, 20, 14, 7, 23, 25, 4].sample
  user_id = (2..7).to_a.sample
  select = book_info.sample
  Book.create!(user_id: user_id,title:select[1], author:select[3], ISBN: select[2], class_name:select[0],
               price: price, condition: con, description:des, for_sale:true, quantity:quantity)


end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

