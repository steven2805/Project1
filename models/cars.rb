require_relative('../db/sql_runner.rb')


class Car

  attr_reader(:id ,:make,:model,:category, :price,:dealer_id)

  def initialize( options )
    @id = options['id'].to_i 
    @make = options['make']
    @model = options['model']
    @category = options['category']
    @price = options['price']
    @dealer_id = options['dealer_id'].to_i
  end 

  def save()
    sql = "INSERT INTO cars (make, model, category, price, dealer_id)
    VALUES 
    ('#{make}','#{model}','#{category}','#{price}','#{dealer_id}')
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i 
  end

  def self.all()
    sql = "SELECT * from cars"
    result = SqlRunner.run(sql)
    return result.map {|single_car| Car.new(single_car)}
  end

  def self.delete_all()
    sql = "DELETE FROM cars"
    SqlRunner.run(sql)
  end 

  def self.find_dealer_cars(id)
    sql = "SELECT * FROM cars WHERE dealer_id = #{id}"
    results = SqlRunner.run( sql )
    return results.map {|car| Car.new(car)}
  end

end 














