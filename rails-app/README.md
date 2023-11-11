# README

#### Start GRPC server
```bash
  ./start_grpc
```

```bash
  bundle exec ruby lib/grpc/server.rb
```

#### Start RAILS
```bash
  ./start_rails
```

```bash
  bundle exec rails s
```


##### BUILD
```bash
docker build --rm -t rgrpc/server .
```

##### RUN

##### Rails server
```bash
docker run --rm --name rgrpc-rails -p 3000:3000 rgrpc/server rails s -b 0.0.0.0
```
##### GRPC Server
```bash
docker run --rm --name  rgrpc-server -p 50051:50051 rgrpc/server bundle exec ruby lib/grpc/server.rb
```

##### Kill
```bash
docker kill rgrpc-rails rgrpc-server
```

##### List of Docker Images
```bash
docker images
```

##### List of Docker Containers
```bash
docker ps
```


GOTO: http://localhost:3000/main/index.json


for x in {1..1000000}; do time curl http://localhost:3000/main/index.json ; done ;
