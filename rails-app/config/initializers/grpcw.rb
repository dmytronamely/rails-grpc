require_relative '../../lib/grpc/helloworld_services_pb'

GRPC_URL = ENV.fetch('GRPC_URL') do 
  "#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}"
end

class Grpcw
  attr_reader :greeters

  def initialize(stub:)
    @greeters = stub
  end
end

class GRPC_STUB
  class << self
    def wrapper
      @wrapper ||= Grpcw.new(stub: Helloworld::Greeter::Stub.new(GRPC_URL, :this_channel_is_insecure))
    end

    def greeters
      wrapper.greeters
    end  
  end  
end  
