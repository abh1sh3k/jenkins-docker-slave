FROM centos:7

#Update the repository
RUN yum -y update && \
# Install openssh server using which Jenkins master would connect
    yum -y install openssh-server openssh-clients && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
# Install Jave 8
    yum -y install java-1.8.0-openjdk && \
# Install git and maven
    yum -y install git && \
    yum -y install maven && \
# Add user jenkins and set password
    useradd jenkins && echo "jenkins:jenkins" | chpasswd && \
# Generate a ssh key
    ssh-keygen -A

# Expose standard ssh port
EXPOSE 22

# Start sshd server
CMD ['/usr/sbin/sshd','-D']