FROM archlinux

# enable multilib
RUN echo '[multilib]' >> /etc/pacman.conf &&\
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf

# install wine
RUN pacman -Sy && pacman -S --noconfirm wine pipewire-jack unzip lib32-libpulse libpulse wine-mono && pacman -Sc --noconfirm

# insall engine-sim
RUN download_url='https://github.com/ange-yaghi/engine-sim/releases/download/v0.1.10a/engine-sim-build_0_1_10a.zip' &&\
    curl -f -L $download_url -o/tmp/engine-sim.zip &&\
    unzip -d /tmp /tmp/engine-sim.zip &&\
    mv /tmp/engine-sim-* /app &&\
    rm /tmp/engine-sim.zip

# wine dir (world writable...)
RUN mkdir /wine && chmod 777 /wine
ENV WINEPREFIX=/wine/mine
ENV WINEARCH=win64
WORKDIR /app/bin

CMD ["bash", "-c", "mkdir $WINEPREFIX; wine engine-sim-app.exe"]
