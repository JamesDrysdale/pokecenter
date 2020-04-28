require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
require_relative('models/vets')
also_reload('/models/*')

# Index - Full register of pokemon, owner and medical details
get '/pokemon' do
    @pokemon = Pokemon.all
    erb(:index)
end

# new
get '/pokemon/new' do
    erb(:new)
end

# Show


# Create
post '/pokemon' do
    @pokemon = Pokemon.new(params).save
    redirect to '/pokemon'
end




# # List of all owners
# get '/owners' do
#     @owners = Owner.all
#     erb(:owners)
# end