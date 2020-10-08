FROM rust:1.43

WORKDIR /rust-gear-book_actix-web
COPY Cargo.toml Cargo.toml
COPY ./src ./src
COPY ./templates ./templates

RUN cargo build --release
RUN cargo install --path .

CMD ["rust-gear-book_actix-web"]