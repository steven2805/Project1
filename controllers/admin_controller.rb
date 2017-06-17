require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')
require_relative('../models/dealers.rb')

get '/admin' do
  erb ( :'admin/index')
end


get '/admin/edit_cars' do
  @dealers = General.all('dealers','Dealer')
  erb ( :'admin/edit_car')
end

get '/admin/new_dealer' do
  erb(:'admin/new_dealer')
end

post '/add_dealer' do
  Dealer.new(params).save
  redirect to '/admin'
end

get '/admin/new_car' do
  @dealers = General.all('dealers','Dealer')
  erb(:'admin/new_car')
end

post '/add_car' do
  params['make'].capitalize
  Car.new(params).save
  redirect to '/admin'
end

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




