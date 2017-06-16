require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/dealers.rb' )
require_relative( '../models/cars.rb')

get '/dealers' do
  @dealers = Dealer.all()
  erb ( :"dealers/index" )
end

get '/dealers/:id' do
  @cars = Car.find_dealer_cars('dealer_id',params['id'])
  erb (:"dealers/dealer_cars")
end 

