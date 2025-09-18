# sonrec-docker

An immature docker image for [SongRec](https://github.com/marin-m/SongRec).

I personally use it like that:

```Dockerfile
FROM ghcr.io/marcw/songrec-docker:latest-debian-bookworm AS songrec

FROM ruby:3.4.5-slim-bookworm

# install the dependencies listed in this repository's Dockerfile
RUN apt-get install build-essential pkg-config intltool libgtk-3-dev libasound2-dev libpulse-dev libgtk-3-dev libssl-dev ffmpeg
COPY --from=songrec /usr/local/cargo/bin/songrec /usr/local/bin/songrec
```

## LICENSE

- This repository is MIT licensed
- ongRec is under a GPL-3.0 license
