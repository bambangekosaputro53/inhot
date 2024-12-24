FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    wget \
    chmod \
    bash \
    python3 \
    python3-pip \
    tar \
    build-essential \
    libx11-xcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libnss3 \
    libcups2 \
    libxss1 \
    libxrandr2 \
    libatk1.0-0 \
    libgtk-3-0 \
    libavahi-client-dev \
    fonts-liberation \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

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
