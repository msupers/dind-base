FROM ubuntu:18.04
#config ali apt sources 
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install \
			      supervisor vim wget net-tools jq openssh-server \
			      -y 
RUN mkdir -p /var/run/sshd 
RUN wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.6.tgz -O /tmp/docker-19.03.6.tgz && tar -zxvf /tmp/docker-19.03.6.tgz -C /usr/bin/ && rm -rf /tmp/docker-19.03.6.tgz
#COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["supervisord"]
