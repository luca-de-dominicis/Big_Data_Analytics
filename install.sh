#!/bin/bash

# Pull the spark image
docker pull spark:latest

# Build the custom image
docker build -t spark-custom:latest .

# Run the custom image
docker run -it -p 8888:8888 -v /path/to/your/data:/opt/spark/work-dir/data spark-custom /bin/bash

