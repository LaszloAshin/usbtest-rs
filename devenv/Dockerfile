FROM debian:10
RUN apt-get update \
	&& apt-get install --yes --no-install-recommends \
		openssh-server \
		sudo \
	&& rm -rf /var/lib/apt/lists/ \
	&& useradd -m -g users -s /bin/bash vagrant \
	&& echo 'vagrant ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/vagrant \
	&& echo chmod 0440 /etc/sudoers.d/vagrant \
	&& install -m0700 -o vagrant -g users -d /home/vagrant/.ssh \
	&& echo vagrant:vagrant | chpasswd \
	&& echo root:vagrant | chpasswd \
	&& mkdir /run/sshd

COPY --chown=vagrant:users vagrant.pub /home/vagrant/.ssh/authorized_keys
EXPOSE 22
ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-oUseDNS=no" ]
