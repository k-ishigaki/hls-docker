FROM ubuntu:24.04
LABEL maintainer="Kazuki Ishigaki <gakia5310027@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential='12.10ubuntu1' \
    curl='8.5.0-2ubuntu10.*' \
    libffi-dev='3.4.6-1build1' \
    libgmp-dev='2:6.3.0+dfsg-2ubuntu6' \
    libgmp10='2:6.3.0+dfsg-2ubuntu6' \
    libncurses-dev='6.4+20240113-1ubuntu2' \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    libffi8ubuntu1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fLo /usr/local/bin/ghcup \
    https://downloads.haskell.org/~ghcup/x86_64-linux-ghcup && \
    chmod +x /usr/local/bin/ghcup

ENV PATH=/usr/local/bin:$PATH

RUN ghcup install ghc --set 9.10.1 && \
    ghcup install cabal --set 3.10.3.0 && \
    ghcup install stack --set 2.15.7 && \
    ghcup install hls --set 2.8.0.0

ENV PATH=/root/.ghcup/bin:$PATH