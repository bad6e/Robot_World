require 'yaml/store'

class RobotInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= YAML::Store.new("db/robot_inventory_test")
    else
      @database ||= YAML::Store.new("db/robot_inventory")
    end
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { "id" => database['total'],
                              "name" => robot[:name],
                              "city" => robot[:city],
                              "state" => robot[:state],
                              "avatar" => database['total'],
                              "birthdate" => robot[:birthdate],
                              "date_hired" => robot[:date_hired],
                              "department" => robot[:department],
                            }
    end
  end

  def self.raw_robots
    database.transaction do
      database['robots'] || []
    end
  end

  def self.all
    raw_robots.map {|data| Robot.new(data) }
  end

  def self.raw_robot(id)
    raw_robots.find {|robot| robot['id'] == id}
  end

  def self.find(id)
    Robot.new(raw_robot(id))
  end

   def self.update(id, robot)
    database.transaction do
      target = database['robots'].find { |data| data["id"] == id }
      target["name"] = robot[:name]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["birthdate"] = robot[:birthdate]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end

  def self.delete(id)
    database.transaction do
      database['robots'].delete_if { |robot| robot["id"] == id }
    end
  end

  def self.delete_all
    database.transaction do
      database["robots"] = []
      database["total"] = 0
    end
  end
end
