require_relative '../../lib/grpc/helloworld_services_pb'

# GRPC_STUB = Helloworld::Greeter::Stub.new('localhost:50051', :this_channel_is_insecure)
# GRPC_STUB = Helloworld::Greeter::Stub.new("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_channel_is_insecure)

class Grpcw
  attr_reader :greeters

  # def initialize(stub:)
  #   @greeters = stub
  # end
  
  # def greeters

  # end  
  # @@greeters = nil

  class << self
    def assign_greeters
      @@greeters = Helloworld::Greeter::Stub.new("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_channel_is_insecure)
    end
    def greeters
      @@greeters ||= Helloworld::Greeter::Stub.new("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_channel_is_insecure)
    end
  end
end

# GRPC_STUB = Grpcw.new(stub: Helloworld::Greeter::Stub.new("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_channel_is_insecure)).freeze
