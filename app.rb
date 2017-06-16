require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/offer_controllers.rb')


get '/' do 
erb (:index)
end