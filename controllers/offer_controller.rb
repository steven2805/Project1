require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/offers.rb' )
require_relative('../models/cars')
require_relative('../models/general.rb')

get '/offers' do
  @offers = Offer.all()
  @cars = General.all("cars","Car")
  erb ( :"offers/index" )
end

