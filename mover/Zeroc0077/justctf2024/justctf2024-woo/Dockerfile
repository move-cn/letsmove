FROM embe221ed/otter_template:latest

ADD ./sources/framework/chall /work/framework/chall
ADD ./sources/framework/src/main.rs /work/framework/src/

# build the challenge contracts
WORKDIR /work/framework/chall
RUN sui move build

WORKDIR /work/framework

# build the framework
RUN touch src/main.rs
RUN cargo build --locked --release

CMD ./run.sh
