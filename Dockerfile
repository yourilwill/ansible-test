FROM centos:7

RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y \
      ansible \
      openssh-server \
      openssh-clients \
      sshpass && \
    rm -rf /var/cache/yum/* && \
    yum clean all && \
    sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:password' | chpasswd && \
    ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

CMD ["usr/sbin/sshd", "-D"]
