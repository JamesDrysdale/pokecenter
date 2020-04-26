require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
also_reload('./models/*')

get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:index)
end