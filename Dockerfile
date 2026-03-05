FROM alpine:latest

ENTRYPOINT ["/usr/local/bin/codex"]

WORKDIR /workspace

RUN apk add --no-cache nodejs npm git bash \
  && npm install -g @openai/codex \
  && codex --version

# running as unprivileged user not possible because: needs access to host files with varying users
# USER 1000:1000
