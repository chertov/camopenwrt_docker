CARGO = ~/.cargo/bin/cargo
CARGO_OPTS =

all:
	$(MAKE) build
	$(MAKE) doc

build:
	#~/.cargo/bin/rustc --target=arm-unknown-linux-musleabi -C linker=arm-openwrt-linux-gcc src/main.rs
	$(CARGO) $(CARGO_OPTS) build --release --target=arm-unknown-linux-musleabi

clean:
	$(CARGO) $(CARGO_OPTS) clean

check:
	$(MAKE) build
	$(MAKE) test

test:
	$(CARGO) $(CARGO_OPTS) test

bench:
	$(CARGO) $(CARGO_OPTS) bench

doc:
	$(CARGO) $(CARGO_OPTS) doc

.PHONY: all build clean check test bench doc
