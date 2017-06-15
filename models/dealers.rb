require_relative('../db/sql_runner')


class Dealer

  attr_reader(:id, :name, :address)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end







end 










