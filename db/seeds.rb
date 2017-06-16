require('pry')
require_relative('../models/dealers.rb')
require_relative('../models/cars.rb')
require_relative('../models/offers.rb')


dealer1 = Dealer.new({
  'name' => "Decent cars",
  'address' => 'Kirkcaldy, KY2 '
  }) 
dealer2 = Dealer.new({
  'name' => "Cars everywhere",
  'address' => 'Glenrothes, KY1'
  }) 

dealer1.save 
dealer2.save 


car1 = Car.new({
  'make' => "Ford",
  'model' => "Capri",
  'category' => "Vintage",
  'price' => 67,
  'dealer_id' => dealer1.id
 })

car2 = Car.new({
  'make' => "Ford",
  'model' => "Ka",
  'category' => "Compact",
  'price' => 25,
  'dealer_id' => dealer1.id
 })

car3 = Car.new({
  'make' => "Mazda",
  'model' => "RX8",
  'category' => "Sport",
  'price' => 70,
  'dealer_id' => dealer1.id
 })

car4 = Car.new({
  'make' => "Mazda",
  'model' => "RX8",
  'category' => "Sport",
  'price' => 82,
  'dealer_id' => dealer2.id
 })

car5 = Car.new({
  'make' => "Subaru",
  'model' => "XV",
  'category' => "SUV",
  'price' => 49,
  'dealer_id' => dealer2.id
 })

car6 = Car.new({
  'make' => "BMW",
  'model' => "M3",
  'category' => "Sport",
  'price' => 110,
  'dealer_id' => dealer2.id
 })

car1.save
car2.save
car3.save
car4.save
car5.save
car6.save

offer1 = Offer.new({
  'name' => "Decent Car Sunday 10% off",
  'value' => 10,
  'day' => "Sunday",
  'car_id' => car1.id,
  'dealers_id' => car1.dealer_id 
  })

offer2 = Offer.new({
  'name' => "Decent Car Monday 10% off",
  'value' => 10,
  'day' => "Monday",
  'car_id' => car3.id,
  'dealers_id' => car3.dealer_id
  })

offer3 = Offer.new({
  'name' => "Everywhere sale 10%",
  'value' => 10,
  'day' => "Tuesday",
  'car_id' => car5.id,
  'dealers_id' => car5.dealer_id
  })





offer1.save
offer2.save 
offer3.save 

binding.pry 
nil 



