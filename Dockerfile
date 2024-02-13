FROM debian:bookworm-slim
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
  ca-certificates \
  curl \
  # unzip \
  && rm -rf /var/lib/apt/lists/*

ARG TARGETARCH

COPY VERSION /VERSION

COPY download-binary.sh /download-binary.sh

RUN chmod +x /download-binary.sh && /download-binary.sh

RUN chmod +x ./standalone
CMD ["./standalone"]
