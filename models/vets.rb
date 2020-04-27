require_relative('../db/sql_runner.rb')

class Vet

    attr_accessor :name
    attr_reader :id

    def initialize ( options )
        id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
       sql = "INSERT INTO vets (name) VALUES ($1)
       RETURNING id" 
       values = [@name]
       result = SqlRunner.run(sql, values)
       id = result.first['id']
       @id = id.to_i
    end

end