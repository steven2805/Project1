require_relative('../db/sql_runner')
require_relative( '../models/dealers.rb')


class General

  def self.all(database_name,class_name)
    sql = "SELECT * FROM #{database_name}"
    result = SqlRunner.run(sql)
      return result.map{ |hash| Module.const_get(class_name).new( hash )} 
  end 
end 