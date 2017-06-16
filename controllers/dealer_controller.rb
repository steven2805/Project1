require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/dealers.rb' )
require_relative('..models/cars.rb')

get '/dealers' do
  @dealers = Dealer.all()
  erb ( :"dealers/index" )
end

get '/dealers/:id/dealer_cars' do
  @cars = Car.find_dealers_cars(params)
end 

