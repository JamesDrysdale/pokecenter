require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/vets')
also_reload('../models/*')

require('pry')

get '/vets' do
    @vets = Vet.all
    erb(:vets)
end

get '/vets/new' do
    @vets = Vet.all
    erb(:new_vet)
end

post '/vets' do
    Vet.new(params).save
    redirect to '/vets'
end


get '/vets/:id' do
    @vets = Vet.find(params['id'])
    erb(:show_vet)
end 

get '/vets/:id/edit_vet' do
    @vets = Vet.all
    @vets = Vet.find(params['id'])
    erb(:edit_vet)
  end
  
  post '/vets/:id' do
    vet = Vet.new(params)
    vet.update
    redirect to "/vets/#{params['id']}"
  end
  
  post '/vets/:id/delete' do
    vet = Vet.find(params['id'])
    vet.delete
    redirect to '/vets'
  end