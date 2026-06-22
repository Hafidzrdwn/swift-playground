FROM swift:latest

WORKDIR /app

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/dev.sh /usr/local/bin/dev

RUN chmod +x /usr/local/bin/dev