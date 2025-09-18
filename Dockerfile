ARG DEBIAN_VERSION=bookworm
ARG SONGREC_DEPENDENCIES="build-essential pkg-config intltool libgtk-3-dev libasound2-dev libpulse-dev libgtk-3-dev libssl-dev ffmpeg"

FROM rust:slim-${DEBIAN_VERSION}

ARG SONGREC_DEPENDENCIES
RUN apt-get update && apt-get install -y --no-install-recommends $SONGREC_DEPENDENCIES \
  && rm -rf /var/lib/apt/lists/*

RUN --mount=type=cache,target=/usr/local/cargo/registry \
  --mount=type=cache,target=/usr/local/cargo/git \
  cargo install songrec --no-default-features -F ffmpeg

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["--help"]
