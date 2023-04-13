FROM rust:latest as builder

COPY ./hello_world/ /hello_world/
WORKDIR /hello_world/

RUN cargo build --release

FROM debian:buster-slim

COPY --from=builder /hello_world/target/release/hello_world /usr/local/bin/hello_world

CMD ["hello_world"]