workers ENV.fetch('WEB_CONCURRENCY') { 4 }
port ENV.fetch("PORT") { 3000 }

on_worker_boot do
  Grpcw.assign_greeters
end
