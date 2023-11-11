require 'grpc'
require_relative 'helloworld_services_pb'

# GreeterServer is simple server that implements the Helloworld Greeter server.
class GreeterServer < Helloworld::Greeter::Service
  # say_hello implements the SayHello rpc method.
  def say_hello(req, _unused_call)
    Helloworld::HelloReply.new(message: "Hello #{req.message}")
  end

  def say_bye(req, _unused_call)
    Helloworld::HelloReply.new(message: "Bye #{req.message}")
  end
end

def main
  puts "Server started on http://#{ENV.fetch('GRPC_SERVER_HOST', '0.0.0.0')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}"
  s = GRPC::RpcServer.new
  s.add_http2_port("#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}", :this_port_is_insecure)
  s.handle(GreeterServer)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGTERM'])
end

main
