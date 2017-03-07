class Database
  extend ObServ::DSL

  subscribe :db_save do |*args|
    puts "save db #{args}"
  end
end
