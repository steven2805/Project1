require_relative('../db/sql_runner.rb')

require_relative('../models/dealers.rb')
require('pry')

class Car

  attr_reader(:id ,:make,:model,:img,:category, :price, :available,:dealer_id)

  def initialize( options )
    @id = options['id'].to_i 
    @make = options['make']
    @model = options['model']
    @img = options['img']
    @category = options['category']
    @price = options['price']
    @available = options['available']
    @dealer_id = options['dealer_id'].to_i
  end 

  def save()
    sql = "INSERT INTO cars (make, model, img , category, price, available, dealer_id)
    VALUES 
    ('#{make}','#{model}','#{img}','#{category}','#{price}','#{available}','#{dealer_id}')
    RETURNING *"
    result = SqlRunner.run(sql)
    @id = result.first()['id'].to_i 
  end

  def update
    sql = "UPDATE cars SET make = '#{@make}', model = '#{@model}',img = '#{img}', category = '#{@category}', available = '#{@available}', dealer_id = '#{@dealer_id}' WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.find(looking_for,id)
    sql = "SELECT * FROM cars WHERE #{looking_for} = #{id}"
    results = SqlRunner.run( sql )
    return results.map {|car| Car.new(car)}
  end

  def self.dealer(id)
    sql = "SELECT * FROM dealers WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return results.map {|deal| Dealer.new(deal)}
  end

  def final_price(offer)
    if offer == nil 
      return 
    else
      @price = @price.to_i - offer.value.to_i
    end 
  end 

end
