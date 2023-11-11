require_relative '../../lib/grpc/helloworld_services_pb'

GRPC_URL = ENV.fetch('GRPC_URL') do 
  "#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}"
end

class Grpcw
  attr_reader :stub

  def initialize(stub:)
    @stub = stub
  end
end

class GRPC_STUB
  class << self
    def wrapper
      @wrapper ||= Grpcw.new(stub: Helloworld::Greeter::Stub.new(GRPC_URL, :this_channel_is_insecure))
    end

    def greeters
      wrapper.stub
    end 
    # INFO: All methods calls sending to wrapper
    # def method_missing(method, *args)
    #   return wrapper.send(method, *args) if wrapper.respond_to?(method)
    # end

    # def respond_to_missing?(method, include_private=false)
    #   wrapper.respond_to?(method)
    # end
  end  
end  
