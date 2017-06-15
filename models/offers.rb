require_relative('../db/sql_runner')

class Offer

  attr_reader(:name ,:value ,:day ,:car_id)

  def initialize( options )
    @id = options['id'].to_i 
    @name = options['name']
    @value = options['value']
    @day = options['day']
    @car_id = options['car_id']
  end



end 



