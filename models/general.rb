require_relative('../db/sql_runner')


class General

  def self.all(table_name,class_name)
    sql = "SELECT * FROM #{table_name}"
    result = SqlRunner.run(sql)
    return result.map{ |hash| Module.const_get(class_name).new( hash )} 
  end 

  def self.delete_all(table_name)
    sql = "DELETE FROM #{table_name}"
    SqlRunner.run(sql)
  end 

  def self.delete_with_id(table_name,id)
    sql = "DELETE FROM #{table_name} WHERE id = #{id}"
    SqlRunner.run(sql)
  end 

end 