require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/offers.rb' )
require_relative('../models/cars')
require_relative('../models/general.rb')

get '/offers' do
  @offers = General.all("offers","Offer")
  @cars = General.all("cars","Car")
  erb ( :"offers/index" )
end

get '../cars/specific/:id' do
  @cars = Car.find_dealer_cars("id",params['id'])
  erb (:"../cars/specific")
end