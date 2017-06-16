require_relative('../db/sql_runner')
require_relative( '../models/dealers.rb')


class General

  def self.all(database_name)
    sql = "SELECT * FROM #{database_name}"
    result = SqlRunner.run(sql)
    if database_name == "cars"
      return result.map {|single_car| Car.new(single_car)}
    elsif database_name == "dealers"
      return result.map{ |hash| Dealer.new( hash )} 
    else 
      return result.map { |hash| Offer.new(hash)}
    end
  end 
end 