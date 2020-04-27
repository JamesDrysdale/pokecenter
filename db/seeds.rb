require_relative('../models/pokemon')

pokemon1 = Pokemon.new({
    'name' => 'Prince Charming',
    'date_of_birth' => '3 Dec',
    'type' => 'Charmander',
    'affinity' => 'Fire',
    'level' => ,
    'allergy' => 'Strawberries',
    'owner_id' => ''
})

pokemon1.save