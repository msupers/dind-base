FROM ubuntu:18.04
#config ali apt sources 
#COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install \
			      supervisor vim git wget net-tools jq openssh-server curl openjdk-8-jdk ansible \
			      -y && apt-get clean && mkdir -p /var/run/sshd && wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.6.tgz -O /tmp/docker-19.03.6.tgz && tar -zxvf /tmp/docker-19.03.6.tgz -C /usr/bin/ && rm -rf /tmp/docker-19.03.6.tgz
#COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY sonar-scanner /usr/local/sonar-scanner
COPY .ssh /root/.ssh 
RUN chmod 600 .ssh/id_rsa && chmod 600 .ssh/id_rsa.pub && chmod 600 .ssh/known_hosts
ENV PATH $PATH:/usr/local/sonar-scanner/bin
CMD ["supervisord"]
