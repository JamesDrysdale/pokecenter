require_relative('../db/sql_runner')

class Owner
    attr_accessor :first_name, :last_name, :phone, :email, :address
    attr_reader :id

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @phone = options['phone']
        @email = options['email']
        @address = options['address']
    end

    def save()
        sql = "INSERT INTO owners
        (
            first_name,
            last_name,
            phone,
            email,
            address
        )
        VALUES
        (
         $1, $2, $3, $4, $5   
        )
        RETURNING id"
        values = [@first_name, @last_name, @phone, @email, @address]
        result = SqlRunner.run(sql, values)
        id = result.first['id']
        @id = id.to_i
    end

    def update()
        sql = "UPDATE owners
        SET
        (
            first_name,
            last_name,
            phone,
            email,
            address 
        ) =
        (
            $1, $2, $3, $4, $5
        )
        WHERE id = $8"
        values = [@first_name, @last_name, @phone, @email, @address]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM owners
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM owners"
        owner_data = SqlRunner.run(sql)
        owners = map_items(owner_data)
        return owners
    end

    def self.map_items(owner_data)
        return house_data.map { |owner| Owner.new(owner) }
    end

    def self.find(id)
        sql = "SELECT * FROM owners
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        owner = Owner.new(result)
        return owner
    end
    
end