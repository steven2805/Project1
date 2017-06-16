require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/offer_controller.rb')
require_relative('controllers/dealer_controller.rb')


get '/' do 
erb (:index)
end