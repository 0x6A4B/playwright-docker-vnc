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


# Change resolution 
xrandr --fb 1024x768