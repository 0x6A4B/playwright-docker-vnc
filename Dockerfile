FROM debian:bookworm

LABEL maintainer="0x6A4B <0x6A4B@proton.me>"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

ENV USER root
ENV HOMEDIR=/home/playwright
RUN mkdir -p $HOMEDIR
WORKDIR $HOMEDIR

RUN apt-get update && \    
    apt-get -qy full-upgrade && \
#    apt-get install -y ubuntu-desktop && \
    apt-get install -y git net-tools novnc supervisor && \

    apt-get install -y wget \
# Minimal X environment
# apt install task-lxde-desktop
#    xorg \
#    xinit \
#    xfce4 \
#    xfce4-goodies \
    openbox \
    tint2 \
# NPM and VIM
    npm \
    neovim \
# VNC
    x11vnc  \
    xvfb && \
# Clean up
    apt-get autoclean -qy && \
    apt-get autoremove -qy
 #   mkdir /root/.vnc

#COPY xstartup /root/.vnc/xstartup

ENV HOME=/root \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    DISPLAY_WIDTH=1024 \
    DISPLAY_HEIGHT=768
#    RUN_XTERM=yes \
#    RUN_FLUXBOX=yes

EXPOSE 9323
EXPOSE 8080

CMD ["websockify", "--web", "/usr/share/novnc", "8080", "localhost:5900"]
CMD ["x11vnc", "-create", "-forever", "-loop"]
#COPY . /app
#CMD ["/app/entrypoint.sh"]