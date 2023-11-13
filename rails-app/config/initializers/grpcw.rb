require_relative '../../lib/grpc/helloworld_services_pb'

GRPC_URL = ENV.fetch('GRPC_URL') do 
  "#{ENV.fetch('GRPC_SERVER_HOST', 'localhost')}:#{ENV.fetch('GRPC_SERVER_PORT', 50051)}"
end

class Grpcw
  attr_reader :stub

  def initialize(service_module:)
    @stub = service_module::Stub.new(GRPC_URL, :this_channel_is_insecure)
  end

  def greeters(*args)
    puts  " = "*50
    puts args
    puts  " = "*50
    stub
  end
  
  # INFO: Call any methods return stub
  # Need comment if wrapper.respond_to?(method) in GRPC_STUB
  # def method_missing(method, *args)
  #   # return wrapper.send(method, *args) if wrapper.respond_to?(method)
  #   puts  " + "*50
  #   puts args
  #   puts  " + "*50
  #   stub
  # end
end

class GRPC_BASE
  include Singleton

  def wrapper
    raise NoMethodError, 'Not Implemented'
  end  

  class << self
    alias_method :svc, :instance
  end

  def method_missing(method, *args)
    return wrapper.send(method, *args) if wrapper.respond_to?(method)
  end
end  

class GRPC_STUB < GRPC_BASE
  def wrapper
    @wrapper ||= Grpcw.new(service_module: Helloworld::Greeter)
  end
end  
