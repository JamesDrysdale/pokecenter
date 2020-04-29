require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/pokemon_controller.rb')
require_relative('controllers/vets_controller.rb')
also_reload('/models/*')
require('pry')

get '/' do
    erb( :index )
end