module Database
  module_function

  extend ObServ::DSL

  subscribe :db_save do |*args|
    puts "save db #{args}"
  end
end
