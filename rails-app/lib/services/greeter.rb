module Services
  class Greeter
    attr_reader :stub, :response

    class << self
      def say_hello(message: 'Undefined')
        new.say_hello(message: message)
      end
      def say_bye(message: 'Undefined')
        new.say_bye(message: message)
      end
    end

    def initialize(hostname: nil)
      @stub = GRPC_STUB.instance.greeters(hello: 'Hellow', world: 'World')
    end

    def say_hello(message:)
      @response = stub.say_hello(Helloworld::HelloRequest.new(message: message))
    rescue GRPC::BadStatus => e
      @response = "ERROR: #{e.message}"
    end

    def say_bye(message:)
      @response = stub.say_bye(Helloworld::HelloRequest.new(message: message))
    rescue GRPC::BadStatus => e
      @response = "ERROR: #{e.message}"
    end    
  end
end
