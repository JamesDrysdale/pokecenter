require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
also_reload('/models/*')

# Index
get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:index)
end