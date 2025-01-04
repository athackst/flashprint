# flashprint

This repository serves as a centralized location for managing everything related to the [FlashPrint](https://flashforge.com/pages/software-flashprint) software. FlashPrint is a slicing and control software for FlashForge 3D printers, and this repository aims to streamline its usage by providing a Dockerized setup, settings files, and other configuration assets.

## Flashprint docker container

Since flashprint software is not yet updated to run on Ubuntu 24.04, I needed to make a dockerized version.

## Quickstart

Use the provided `flashprint.sh` script to start the container

```bash
./flashprint.sh
```

## Prerequisites

Ensure the following are installed on your system:

- **Docker**: [Installation Guide](https://docs.docker.com/get-docker/)
- **X11 Display Server**: Required for graphical applications in Docker.

## Building the Docker Image

1. Clone the repository or copy the `Dockerfile` and the `.deb` package into a directory.
2. Build the Docker image:
   ```bash
   docker build -t flashprint:latest .
   ```
## Running the Container

Use the provided `run-flashprint.sh` script to start the container:

1. Make the script executable:
   ```bash
   chmod +x run-flashprint.sh
   ```
2. Run the script:
   ```bash
   ./run-flashprint.sh
   ```

This will launch the FlashPrint GUI, accessible on your local machine.

## Volumes and File Access

- **Workspace Volume**: The script maps `~/3DPrints` on your host to `/workspaces/3DPrints` in the container. Place your `.gcode` or `.stl` files in this directory for easy access.
- **X11 Display**: Maps the X11 socket for graphical output.
- **Direct Rendering**: Shares `/dev/dri` for OpenGL rendering.
