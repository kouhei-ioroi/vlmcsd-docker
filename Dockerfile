FROM alpine:latest AS builder

COPY vlmcsd /vlmcsd
USER root:root
RUN apk add --no-cache git make build-base && \
    cd /vlmcsd/ && \
    make LDFLAGS='-static -no-pie'

FROM gcr.io/distroless/static-debian13:latest

COPY --from=builder /vlmcsd/bin/vlmcsd /usr/bin/vlmcsd
EXPOSE 1688/tcp
USER nonroot:nonroot
CMD [ "/usr/bin/vlmcsd", "-D", "-e", "-v", "-d" ]