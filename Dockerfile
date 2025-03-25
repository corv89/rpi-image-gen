FROM debian:bookworm AS base

# Set up work directory
WORKDIR /rpi-image-gen
COPY . /rpi-image-gen/

# Install build dependencies
RUN apt-get update && /rpi-image-gen/install_deps.sh && rm -rf /var/lib/apt/lists/*

# Create non-root user
ENV USER=builder
RUN useradd -u 4000 -ms /bin/bash "$USER" && \
    chown -R ${USER}:${USER} /rpi-image-gen

# Switch to non-root user
USER ${USER}
WORKDIR /home/${USER}

# Copy repo to user's home directory
RUN cp -r /rpi-image-gen ~/

# Set working directory to repo copy
WORKDIR /home/builder/rpi-image-gen

ENTRYPOINT ["./build.sh"]
CMD []
