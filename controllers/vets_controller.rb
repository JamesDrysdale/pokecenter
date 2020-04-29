require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vets')
also_reload('../models/*')

require('pry')

get '/vets' do
    @vets = Vet.all
    erb(:vets)
end