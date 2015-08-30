require 'sequel'

class RobotInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/robot_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_inventory.sqlite3")
    end
  end

  def self.create_table
    database.create_table :robots do
      primary_key :id
      String :name
      String :city
      String :state
      Date :birthdate
      Date :date_hired
      String :department
    end
  end

  def self.create(robot)
    @robots = database.from(:robots)
    id = @robots.insert({:name => robot[:name],
                        :city => robot[:city],
                        :state => robot[:state],
                        :birthdate => robot[:birthdate],
                        :date_hired => robot[:date_hired],
                        :department => robot[:department]})
    find(id)
  end

  def self.all
    raw_robots = database.from(:robots).all
    raw_robots.map { |data| Robot.new(data)}
  end

  def self.find(id)
    raw_robot = database.from(:robots).where(:id => id).first
    Robot.new(raw_robot)
  end

   def self.update(id, robot)
    database.from(:robots).
    where(:id => id).update(
          :name => robot[:name],
          :city => robot[:city],
          :state => robot[:state],
          :birthdate => robot[:birthdate],
          :date_hired => robot[:date_hired],
          :department => robot[:department])
    end

  def self.delete(id)
    database.from(:robots).where(:id => id).delete
  end

  def self.delete_all
    database.from(:robots).delete
  end
end
