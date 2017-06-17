require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')

get '/admin' do
  erb ( :'admin/index')
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
  Car.new(params).save
  redirect to '/admin'
end

get '/admin/add_offer' do
  @dealers = General.all('dealers','Dealer')
  @car - General.all('cars',"Car")
  erb(:'admin/new_offer')
end

post '/admin/add_offer' do
  Offer.new(params).save
  redirect to '/admin'
end




