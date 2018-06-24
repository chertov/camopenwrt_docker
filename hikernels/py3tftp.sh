if [ ! -d $(pwd)/output/ ]; then mkdir -p $(pwd)/output/; fi
(
    cd $(pwd)/output/ && \
    sudo py3tftp --host 0.0.0.0 --port 69 --ack-timeout 100 --conn-timeout 100 --verbose
)
