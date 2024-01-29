#!/bin/bash

# Pull the spark image
docker pull spark:latest

# Build the custom image
docker build -t spark-custom:latest .

