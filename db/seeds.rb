require_relative('../models/pokemon')
require_relative('../models/owners')
require_relative('../models/vets')

vet1 = Vet.new({
    'name' => 'Nurse Joy'
})

vet1.save

# owner1 = Owner.new({
#     'first_name' => 'Ash',
#     'last_name' => 'Ketchum',
#     'phone' => '76665 566 666',
#     'email' => 'ash.ketchum@legendarytrainers.net',
#     'address' => 'Pallet Town'
# })

# owner1.save

pokemon1 = Pokemon.new({
    'name' => 'Prince Charming',
    'date_of_birth' => '3 Dec',
    'type' => 'Charmander',
    'affinity' => 'Fire',
    'level' => 5,
    'allergy' => 'Strawberries',
    'owner_first_name' => 'Ash',
    'owner_last_name' => 'Ketchum',
    'phone' => '76665 566 666',
    'email' => 'ash.ketchum@legendarytrainers.net',
    'address' => 'Pallet Town',
    'vet_id' => vet1.id,
    'notes' => '2020-04-05: Injury: Broken tailbone Treatment: Set in cast'
})

pokemon1.save

# pokemon2 = Pokemon.new({
#     'name' => 'Prince Charming',
#     'date_of_birth' => '3 Dec',
#     'type' => 'Charmander',
#     'affinity' => 'Fire',
#     'level' => 5,
#     'allergy' => 'Strawberries',
#     'owner_id' => owner1.id
# })

# pokemon2.save
