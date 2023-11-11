rails new app --api -v 6.1.7 -d postgresql

https://github.com/bigcommerce/gruf-demo/tree/main

bin/rails runner 'puts ActiveSupport::Dependencies.autoload_paths'

#### Docker Compose
##### RUN
```bash
  docker-compose up --remove-orphans
```
#####  R-Build and Run
```bash
  docker-compose up --remove-orphans --build
```
##### Migrate DB
```bash
docker-compose run --rm app rake db:create
```

GOTO: http://localhost:3000/main/index.json

##### Provided GRPC error (return 500)
```ruby
RuntimeError (grpc cannot be used before and after forking):
```
