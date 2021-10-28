FROM archlinux
RUN useradd -mG wheel danny && echo danny:test | chpasswd
RUN pacman -Sy && pacman -S vi base-devel reflector git openssh --noconfirm && reflector -c Australia -a 6 --sort rate --save /etc/pacman.d/mirrorlist && pacman -Sy && pacman -S ansible --noconfirm
RUN sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers >> /etc/sudoers
WORKDIR /home/danny/dzk-bootstrap
COPY . .
