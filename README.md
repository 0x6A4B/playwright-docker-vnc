# playwright-docker-vnc
Dockerfile for using Playwright through VNC

## Build

```
docker build -t 0x6a4b/playwright-vnc .
```


## Run

```
docker run -d --net=host -v ./playwright_volume:/home/playwright --name playwright 0x6a4b/playwright-vnc
```

test
```
podman run -it --rm  --net=host -v ./test:/home/playwright --name test test:latest bash
```

```
websockify --web /usr/share/novnc 8080 localhost:5900 &
x11vnc -create -forever -shared
```

# Change resolution 
xrandr --fb 1024x768
