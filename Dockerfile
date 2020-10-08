FROM rust:1.43 AS builder

WORKDIR /rust-gear-book_actix-web
COPY Cargo.toml Cargo.toml
RUN mkdir src
RUN echo "fn main(){}" > src/main.rs
RUN cargo build --release
COPY ./src ./src
COPY ./templates ./templates
RUN rm -f target/release/deps/rust_gear_book_actix_web*
RUN cargo build --release

FROM debian:10.4
COPY --from=builder /rust-gear-book_actix-web/target/release/rust-gear-book_actix-web /usr/local/bin/rust-gear-book_actix-web
CMD ["rust-gear-book_actix-web"]
