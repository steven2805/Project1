require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')
require_relative('../models/dealers.rb')

get '/admin' do
  erb ( :'admin/index')
end

# used to get the dealer specific cars, used within the delete function

get '/admin/dealer_spec_cars/:id/' do
  @cars = Car.find('dealer_id',params['id'])
  erb (:"admin/dealer_spec_cars")
end 

# car delete

post '/admin/car/:id/delete' do
  General.delete_with_id("cars",params['id'])
  redirect to '/admin'
end

# dealer deleter 

post '/admin/dealer/:id/delete' do
  General.delete_with_id("dealers",params['id'])
  redirect to '/admin'
end 


get '/admin/edit_cars' do
  @dealers = General.all('dealers','Dealer')
  erb ( :'/admin/edit_car')
end

get '/admin/car/:car_id/edit' do
  @car = Car.find('id',params['car_id'])[0]
  @current_dealer = Dealer.find('id', @car.dealer_id)
  @dealers = General.all("dealers","Dealer")
  #puts @car[0].inspect
  erb (:'/admin/edit')
end

post '/admin/car/:car_id/edit' do
  car2 = Car.new(params)
  puts car2.inspect
  car2.update
  redirect to '/admin'
end

# ||||||||||||||Creating New databasew items|||||||||||||||

# creating a new dealer

get '/admin/new_dealer' do
  erb(:'admin/new_dealer')
end

post '/add_dealer' do
  Dealer.new(params).save
  redirect to '/admin'
end

# creating a new car

get '/admin/new_car' do
  @dealers = General.all('dealers','Dealer')
  erb(:'admin/new_car')
end

post '/add_car' do
  Car.new(params).save
  redirect to '/admin'
end

# creating a new offer

get '/admin/new_offer' do
  @cars = General.all('cars',"Car") 
  @dealers = General.all('dealers','Dealer')
  erb(:'admin/new_offer')
end

post '/add_offer' do
  tempholding = params["car_id"]
  originalname = params['name']
  carz = Car.find('id', tempholding )
  makeholding = carz.first.make
  modelholding = carz.first.model 
  finalholding = "#{makeholding} #{modelholding}"
  params['name'] = "#{finalholding} #{originalname}"
  params.delete('captures')
  params['dealers_id'] = carz.first.dealer_id.to_i
  Offer.new(params).save
  redirect to '/admin'
end
