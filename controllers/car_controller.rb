require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')
require_relative( '../models/offers.rb')


get '/cars' do
  erb ( :'cars/index')
end

get '/cars/:search' do
  @cars = Car.find('id',params['search'])
  @offer = Offer.find('car_id', params['search'])
  @car = @cars.first 
  @car.final_price(@offer.first)
  @dealer = Car.dealer(@cars.first.dealer_id)
  erb (:'cars/spec')
end














