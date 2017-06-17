require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')

get '/admin' do
  erb ( :'admin/index')
end

get '/admin/new_car' do
  @dealers = General.all('dealers','Dealer')
  erb(:'admin/new_car')
end

post '/admin' do
  Car.new(params).save
end
