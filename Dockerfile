FROM maven:3.6.3-jdk-14

RUN useradd -m -d /home/Jenkins -u 1000 -s /bin/bash jenkins

RUN yum install -y openssh-clients
