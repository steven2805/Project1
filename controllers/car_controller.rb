require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')

get '/cars' do
  erb ( :'cars/index')
end

get '/cars/:search' do
  puts params['search']
  @cars = Car.find('id',params['search'])
  erb (:'cars/spec')
end

