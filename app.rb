require('sinatra')
require('sinatra/contrib/all')
require_relative('models/pokemon')
require_relative('controllers/vets_controller.rb')
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

get '/pokemon/:id' do
    @pokemon = Pokemon.find(params['id'])
    erb(:show)
end 

get '/pokemon/:id/edit' do
    @vets = Vet.all
    @pokemon = Pokemon.find(params['id'])
    erb(:edit)
  end
  
  post '/pokemon/:id' do
    pokemon = Pokemon.new(params)
    pokemon.update()
    redirect to "/pokemon/#{params['id']}"
  end
  
  post '/pokemon/:id/delete' do
    pokemon = Pokemon.find(params['id'])
    pokemon.delete
    redirect to '/pokemon'
  end

  



