require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/cars.rb')

get '/admin' do
  erb ( :'admin/index')
end