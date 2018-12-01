ARG VERSION=3.7.1
FROM python:$VERSION
RUN apt-get update && apt-get install -y openssh-server sudo
RUN mkdir /var/run/sshd
RUN echo 'root:pycharm' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN echo "export VISIBLE=now" >> /etc/profile
ADD helpers /opt/.pycharm_helpers
CMD ["/usr/sbin/sshd", "-D"]
