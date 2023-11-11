#!/bin/bash
# for x in {1..1000000}; do
# time curl http://localhost:3000/main/index.json &
# time curl http://localhost:3000/main/index.json &
# time curl http://localhost:3000/main/index.json &
# done;
# wait


for x in {1..1000000}; do time curl http://localhost:3000/main/index.json ; done ;
