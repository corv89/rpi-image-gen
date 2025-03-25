#!/bin/bash

# Run the container with build.sh as the entrypoint
docker run -it --rm --privileged rpi-image-gen "$@"