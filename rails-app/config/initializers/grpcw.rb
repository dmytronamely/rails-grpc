require_relative '../../lib/grpc/helloworld_services_pb'

class Grpcw
  attr_reader :greeters

  def initialize(stub:)
    @greeters = stub
  end
end

GRPC_STUB = Grpcw.new(stub: Helloworld::Greeter::Stub.new("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_channel_is_insecure)).freeze
