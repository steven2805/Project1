require_relative('../db/sql_runner')

class Offer

  attr_reader(:name ,:value ,:day ,:car_id, :dealers_id)

  def initialize( options )
    @id = options['id'].to_i 
    @name = options['name']
    @value = options['value']
    @day = options['day']
    @car_id = options['car_id']
    @dealers_id = options['dealers_id']
  end


  def save()
    sql = "INSERT INTO offers (name, value, day, car_id, dealers_id) 
    VALUES ('#{name}','#{value}','#{day}','#{car_id}','#{dealers_id}')
    RETURNING * "
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i 
  end

end 



