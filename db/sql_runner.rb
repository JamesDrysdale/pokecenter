require('pry')

class SqlRunner

    def self.run(sql, values = [])
        begin
            db = PG.connect({dbname: 'pokecenter', host: 'localhost'})
            dbprepare("query", sql)
            result = db.exec_prepared("query", values)
        ensure
            db.close() if db != nil
        end
            return result
    end
end