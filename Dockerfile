FROM centos:7
MAINTAINER Josh
LABEL owner="Josh Chen" email="xx@gmail.com" description="test" version="1.0"
RUN yum update -y && \
    yum install -y iproute sudo which rsyslog logrotate file parted make cronie openssl \
    wget rsync initscripts openssh openssh-server && yum clean all
RUN echo "root123" | passwd root --stdin
RUN /usr/sbin/sshd-keygen -A
RUN systemctl enable sshd
EXPOSE 22
