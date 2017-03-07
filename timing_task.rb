require './ob_serv'
require './api'
class TimingTask
  def self.run
    Api.new.task
  end
end
