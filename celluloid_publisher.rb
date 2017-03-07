require 'celluloid/current'

module ObServ
  class CelluloidPublisher
    def self.publish(event, *args)
      Wrapper.new.async.publish(event, *args)
    end

    class Wrapper
      include ::Celluloid
      def publish(event, *args)
        ObServ.publish event, *args
      end
    end

    def self.register
      method = ObServ::CelluloidPublisher.method(:publish)
      ObServ.config[:publish] = method
    end
  end
end

ObServ::CelluloidPublisher.register
