require './ob_serv'
require './api'
module TimingTask
  module_function

  def run
    Api.task
  end
end
