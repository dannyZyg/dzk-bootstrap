FROM archlinux

RUN pacman -Syu --noconfirm \
  && pacman -S vi base-devel reflector git openssh --noconfirm \
  && reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist \
  && pacman -Sy \
  && pacman -S ansible --noconfirm

RUN useradd -mG wheel danny && echo danny:test | chpasswd
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

WORKDIR /home/danny/dzk-bootstrap/
COPY . .
