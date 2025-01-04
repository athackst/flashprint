#!/bin/bash
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    --env XAUTHORITY=$XAUTHORITY \
    --env XDG_RUNTIME_DIR=/tmp/runtime-root \
    --env LIBGL_ALWAYS_SOFTWARE=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume /usr/lib/x86_64-linux-gnu:/usr/lib/x86_64-linux-gnu \
    --volume /usr/share/glvnd:/usr/share/glvnd \
    --volume $HOME/.Xauthority:/root/.Xauthority:rw \
    --volume /dev/dri:/dev/dri \
    --volume $HOME/3DPrints:/worskpaces/3DPrints \
    --device /dev/dri \
    --net=host \
    althack/flashprint:latest \
    flashprint
