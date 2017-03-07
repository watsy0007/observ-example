require './ob_serv'
require './database'
module Api
  module_function

  extend ObServ::DSL

  def task
    data = http_or_fake
    publish :db_save, data
    publish :api_task_done, data
  end

  def http_or_fake
    data = [1, 2]
    puts "get data: #{data}"
    data
  end

  subscribe :task_detail do |*args|
    data = args.shift
    publish :db_save, data
    publish :api_task_detail, data
  end
end
