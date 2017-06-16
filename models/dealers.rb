require_relative('../db/sql_runner')


class Dealer

  attr_reader(:id, :name, :address)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO dealers ( name, address) 
    VALUES ( '#{ @name }','#{ @address }') 
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i
  end

  def self.all 
    sql = "SELECT * FROM dealers"
    results = SqlRunner.run(sql)
    return results.map{ |hash| Dealer.new( hash )} 
  end 

  def self.delete_all 
    sql = "DELETE FROM dealers"
    SqlRunner.run(sql)
  end 




end 










