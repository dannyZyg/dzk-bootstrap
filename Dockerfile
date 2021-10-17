FROM archlinux
ARG TAGS
WORKDIR /usr/local/bin
RUN pacman -Sy && pacman -S reflector --noconfirm && reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist && pacman -Sy && pacman -S ansible --noconfirm
COPY . .
