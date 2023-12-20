FROM debian:bookworm-slim
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    ca-certificates \
    curl \
    # unzip \
  && rm -rf /var/lib/apt/lists/*
RUN curl https://oso-local-development-binary.s3.amazonaws.com/oso-local-development-binary-linux-x86_64.tar.gz --output local.tar.gz \
  && tar -xzf local.tar.gz \
  && rm local.tar.gz
RUN chmod +x ./standalone
CMD ["./standalone"]
