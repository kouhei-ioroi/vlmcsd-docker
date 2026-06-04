FROM alpine:latest AS builder
RUN apk add --no-cache git make build-base && \
    git clone --branch master --single-branch https://github.com/Wind4/vlmcsd.git && \
    cd /vlmcsd/ && \
    make LDFLAGS='-static -no-pie'

FROM gcr.io/distroless/static-debian13:latest
COPY --from=builder /vlmcsd/bin/vlmcsd /usr/bin/vlmcsd
EXPOSE 1688/tcp
CMD [ "/usr/bin/vlmcsd", "-D", "-e", "-v", "-d" ]