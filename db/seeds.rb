User.destroy_all
Capture.destroy_all

users = []
users[0] = User.create email: "juan@mac.com", password: "password", password_confirmation: "password"
users[1] = User.create email: "vale@mac.com", password: "password", password_confirmation: "password"
users[2] = User.create email: "mai@mac.com", password: "password", password_confirmation: "password"
users[3] = User.create email: "pato@mac.com", password: "password", password_confirmation: "password"
users[4] = User.create email: "neo@mac.com", password: "password", password_confirmation: "password"
users[5] = User.create email: "alfredo@mac.com", password: "password", password_confirmation: "password"

50.times do |c|
  capture = Capture.create remote_photo_url: Faker::Avatar.image("my-own-slug-" + c.to_s, "300x300", "jpg"),
                           comment: Faker::Lorem.sentence(3, true),
                           user: users[Random.rand(users.length)]

end
