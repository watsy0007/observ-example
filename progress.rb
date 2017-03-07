require 'byebug'
module Progress
  module_function

  extend ObServ::DSL

  subscribe :api_task_done do |*args|
    args.shift.each do |val|
      puts "progress data: #{val}"
      publish :task_detail, val
    end
  end

  subscribe :api_task_detail do |*args|
    data = args.shift
    puts "data detail #{data}"
  end
end
