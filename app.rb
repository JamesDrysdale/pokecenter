require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
require_relative('models/owners')
also_reload('/models/*')

# Index - list of all pokemon
get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:index)
end

# List of all owners
get '/owners' do
    @owners = Owner.all
    erb(:owners)
end