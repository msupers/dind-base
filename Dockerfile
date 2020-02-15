FROM ubuntu:18.04
#config ali apt sources 
COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install \
			      supervisor vim wget net-tools jq openssh-server \
			      -y 
RUN mkdir -p /var/run/sshd 
#COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY ./docker /usr/bin
CMD ["supervisord"]
