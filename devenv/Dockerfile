FROM ubuntu:18.04
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends \
		openssh-server \
		sudo \
	&& rm -rf /var/lib/apt/lists/ \
	&& useradd -m -g users -G sudo -s /bin/bash vagrant \
	&& install -m0700 -o vagrant -g users -d /home/vagrant/.ssh \
	&& echo vagrant:vagrant | chpasswd \
	&& mkdir /run/sshd

COPY --chown=vagrant:users vagrant.pub /home/vagrant/.ssh/authorized_keys
EXPOSE 22
ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]
