require_relative('../db/sql_runner.rb')

class Pokemon

    attr_accessor :name, :date_of_birth, :type, :allergy, :affinity, :level, :owner_first_name, :owner_last_name, :phone, :email, :address
    attr_reader :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date_of_birth = options['date_of_birth']                
        @type = options['type']
        @allergy = options['allergy']
        @affinity = options['affinity']
        @level = options['level']
        @owner_first_name = options['owner_first_name']
        @owner_last_name = options['owner_last_name']
        @phone = options['phone']
        @email = options['email']
        @address = options['address']
        
    end

    def save()
        sql = "INSERT INTO pokemon
        (
            name,    
            date_of_birth,
            type,
            allergy,
            affinity,
            level,
            owner_first_name,
            owner_last_name,
            phone,
            email,
            address
             
        )
        VALUES
        (
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
        )
        RETURNING id"
        values = [@name, @date_of_birth, @type, @allergy, @affinity, @level, @owner_first_name, @owner_last_name, @phone, @email, @address]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end

    def update()
        sql = "UPDATE pokemon
        SET
        (
            name,
            date_of_birth,
            type,
            allergy,
            affinity,
            level,
            owner_first_name,
            owner_last_name,
            phone,
            email,
            address
             
        ) =
        (
            $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
        )
        WHERE id = $12"
        values = [@name, @date_of_birth, @type, @allergy, @affinity, @level, @owner_first_name, @owner_last_name, @phone, @email, @address]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM pokemon
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM pokemon"
        pokemon_data = SqlRunner.run(sql)
        pokemon = map_items(pokemon_data)
        return pokemon
    end

    def self.map_items(pokemon_data)
        return pokemon_data.map { |pokemon| Pokemon.new(pokemon) }
    end
        
    def self.find(id)
        sql = "SELECT from pokemon
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        pokemon = Pokemon.new(result)
        return pokemon
    end

    def owner()
        owner = Owner.find(@owner_id)
        return owner
    end


end
