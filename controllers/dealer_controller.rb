require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/dealers.rb' )
require_relative( '../models/cars.rb')
require_relative( '../models/general.rb')

get '/dealers' do
  @dealers = General.all("dealers","Dealer")
  erb (:"dealers/index")
end

# Find all cars for a specific dealer

get '/dealers/:id/' do
  @cars = Car.find('dealer_id',params['id'])
  @dealer = Car.dealer(@cars.first.dealer_id)
  @dealer_first = @dealer.first
  erb (:"dealers/dealer_cars")
end 