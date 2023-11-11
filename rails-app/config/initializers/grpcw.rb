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

# INFO: This solution provide GRPC for issue
GRPC_STUB = Grpcw.new(stub: Helloworld::Greeter::Stub.new(GRPC_URL, :this_channel_is_insecure)).freeze
