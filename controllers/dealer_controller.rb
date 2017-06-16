require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/dealers.rb' )

get '/dealers' do
  @dealers = Dealer.all()
  erb ( :"dealers/index" )
end