#!/bin/bash

# Build the Docker image from Dockerfile
docker build -t rpi-image-gen -f Dockerfile .

echo "Docker image 'rpi-image-gen' built successfully."
echo "Run it with ./run-docker.sh [build.sh options]"