FROM centos:7

RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y ansible && \
    yum install -y openssh-server && \
    yum install -y openssh-client && \
    sed -ri 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    echo 'root:password' | chpasswd && \
    ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key

CMD ["usr/sbin/sshd", "-D"]
