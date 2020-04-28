require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
require_relative('models/vets')
also_reload('/models/*')
require('pry')

# Index - Full register of pokemon, owner and medical details
get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:index)
end

get '/pokemon/new' do
    @vets = Vet.all
    erb(:new)
end

#  new - duplicate
# get '/pokemon/new' do
#     erb(:new)
# end

# Create
post '/pokemon' do
    Pokemon.new(params).save
    redirect to '/pokemon'
end






