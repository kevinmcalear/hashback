# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.new(
  email: "kevin@sscorp.com", 
  first_name: "Kevin", 
  last_name: "McAlear",
  dob: "April 24th, 1987",
  instagram_username: "kevinmcalear",
  profile_picture_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg",
  phone_number: "4195089075",
  password: "1234",
  password_confirmation: "1234"
  )

user1.save

user1.stories.create(
  hashtag: "testing",
  the_story: "I love testing, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "yolo",
  the_story: "I love yolo, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "swag",
  the_story: "I love swag, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "testing",
  the_story: "I love testing, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "yolo",
  the_story: "I love yolo, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "swag",
  the_story: "I love swag, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "testing",
  the_story: "I love testing, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "yolo",
  the_story: "I love yolo, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )

user1.stories.create(
  hashtag: "swag",
  the_story: "I love swag, it's so much fun. Wooooo testtttting.",
  photo_url: "http://distilleryimage2.ak.instagram.com/6a3d6cc083e511e380bc0a22dc3ee402_8.jpg"
  )