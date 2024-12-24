FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    chmod \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Download miner binary
RUN wget https://github.com/Project-InitVerse/ini-miner/releases/download/v1.0.0/iniminer-linux-x64 \
    && chmod +x iniminer-linux-x64

# Copy startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Entry point
ENTRYPOINT ["/app/start.sh"]
