puts "create admin"
User.create! name: "admin", role: "admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456"

puts "create users"
(1..10).each do |index|
  User.create! name: Faker::Name.last_name, role: "user", email: "user#{index}@gmail.com",
    password: "123456", password_confirmation: "123456"
  end

puts "create musical instruments"
MusicalInstrument.create! name: "Violin", price: 5000,
  material: "wood", brand: "Italy",
  musical_instrument_sellers_attributes: {"0": {name: "amazon.com"}, "1": {name: "lazada.com"}},
  musical_instrument_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/violin1.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/violin2.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/violin3.jpg"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/violin4.jpg"))},
    "4": {image: File.open(File.join(Rails.root, "app/assets/images/violin5.jpg"))}
  }

MusicalInstrument.create! name: "Piano", price: 3000,
  material: "wood", brand: "France",
  musical_instrument_sellers_attributes: {"0": {name: "amazon.com"}, "1": {name: "google.com"}},
  musical_instrument_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/piano1.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/piano2.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/piano3.jpg"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/piano4.jpg"))}
  }

MusicalInstrument.create! name: "Gitar", price: 3000,
  material: "wood", brand: "VietNam",
  musical_instrument_sellers_attributes: {"0": {name: "chotot.com"}, "1": {name: "dmm.com"}},
  musical_instrument_images_attributes: {
    "0": {image: File.open(File.join(Rails.root, "app/assets/images/gitar1.jpg"))},
    "1": {image: File.open(File.join(Rails.root, "app/assets/images/gitar2.jpg"))},
    "2": {image: File.open(File.join(Rails.root, "app/assets/images/gitar3.jpg"))},
    "3": {image: File.open(File.join(Rails.root, "app/assets/images/gitar4.jpg"))}
  }

puts "Create Posts"
(1..3).each do |index|
  MusicalInstrument.all.each do |musical_instrument|
    Post.create! musical_instrument: musical_instrument,
      content: Faker::Lorem.paragraph, user: User.user.shuffle.first,
      name: "#{musical_instrument.name} Review", description: Faker::Lorem.sentence,
      sound_quality: "normal", felling: "great",
      image: File.open(File.join(Rails.root, "app/assets/images/#{musical_instrument.name.downcase!}#{index}.jpg"))
  end
end

puts "Create Comments"
5.times do
  Post.all.each do |post|
    Comment.create! user: User.user.shuffle.last, target_id: post.id, target_type: "Post",
      content: Faker::Lorem.sentence
  end
end
