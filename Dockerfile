FROM archlinux:latest

RUN pacman -Sy --noconfirm base-devel git ansible

RUN useradd axelz -m # Create the builduser
RUN passwd -d axelz # Delete the buildusers password
RUN printf 'axelz ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo

WORKDIR /home/axelz
USER axelz
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
