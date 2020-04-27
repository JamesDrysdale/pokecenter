require_relative('../db/sql_runner.rb')

class Pokemon

    attr_reader(:id, :name, :date_of_birth, :type, :allergy, :affinity, :level, :owner_id)

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @date_of_birth = options['date_of_birth']                
        @type = options['type']
        @allergy = options['allergy']
        @affinity = options['affinity']
        @level = options['level']
        @owner_id = options['owner']
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
            owner_id
        )
        VALUES
        (
            $1, $2, $3, $4, $5, $6, $7
        )
        RETURNING id"
        values = [@name, @date_of_birth, @type, @allergy, @affinity, @level, @owner_id]
        result = SqlRunner.run(sql, values)
        id = result.first[id]
        @id = id
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
            owner_id 
        ) =
        (
            $1, $2, $3, $4, $5, $6, $7
        )
        WHERE id = $8"
        values = [@name, @date_of_birth, @type, @allergy, @affinity, @level, @owner_id]
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


end
