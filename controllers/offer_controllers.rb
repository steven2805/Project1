require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/offers.rb' )
require_relative('../models/cars')

get '/offers' do
  @offers = Offer.all()
  @cars = Car.all()
  erb ( :"offers/index" )
end