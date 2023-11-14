activate_control_app
state_path ENV.fetch('PUMA_STATE_FILE', '/tmp/puma.state')

# workers ENV.fetch('WEB_CONCURRENCY') { 4 }
port ENV.fetch("PORT") { 3000 }
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

# preload_app!
# on_worker_boot do
#   GRPC.prefork
# end

# on_booted do
#   GRPC.prefork
# end

# on_worker_boot do
#   GRPC_STUB = Grpcw.new(stub: Helloworld::Greeter::Stub.new(GRPC_URL, :this_channel_is_insecure)).freeze
# end

# class Client
#   @@client = Grpcw.new(stub: Helloworld::Greeter::Stub.new(GRPC_URL, :this_channel_is_insecure)).freeze

#   class << self
#     def stub
#       @@client
#     end  
#   end  
# end  

# preload_app!

# on_worker_boot do
# end

# on_booted do
#   # configuration here
#   # Client.stub
# end
