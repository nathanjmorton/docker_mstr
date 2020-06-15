#!/bin/bash

mkdir -p /root/.ssh
chmod 600 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD1u1m1yrCbOaAZ5BaGwfaru9wsJFv8JFAiPe09WRgwzWKq70mPh2XTDG6inWlmYMJj+yNQS0HtKmgND4Xmc3pCjUNF8uj4ncmGt2X1dnwho1Xj/uXisANgH5A+TZg7fPW4q9FKjDBnMp/kF8E0bnPqaqfk8wevPpMUGcrI4b02WfUrntHTKr+dRzHbG/tlURLE909Jmsc23ujr8ngudok9llp8kspWshmrDAyMMUgS/Rv+bzl4BpJ6JBheDKJXMkwxkcuT4dNkPhbN/QVlQMrtkqIUF79dqPgFt2lU2tPmJ7+5wKhDaH9Y+CJzVrTQF7e1gNX+PdRkSroAHKb+oJDewq+qnfGVrdeQhaLp6CEc4F1JGXQfGK0qgVHgnYRA57BCPEPHaZoGp2O6AbLfsWzNSxOGTyv8Q28jOWu3Kqdr9GN8WS/3FwXH1ulmQYiq8NDAbyt3UFupgmKInbpDajiX2rarmxdOUc17Y5Sefo6VrWN5UWX1wr+HamJ7AEOQMAp9tRav6TR2OmrRSIYbAqJZ/EB6WmTf/O4geshUmBAYEeYP1+DOqkTgQzGRzILyCIkG3JXz1cXtssPhVToGbm0Q55Y11PTl+JZQqXZpgfFFfzaVx9412WK32uG0kg2RReqxVE3l9uMcjTEqgPao95C5yNE5vWdpmNCnW7visERwww== nathan.j.morton@gmail.com" > /root/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD1u1m1yrCbOaAZ5BaGwfaru9wsJFv8JFAiPe09WRgwzWKq70mPh2XTDG6inWlmYMJj+yNQS0HtKmgND4Xmc3pCjUNF8uj4ncmGt2X1dnwho1Xj/uXisANgH5A+TZg7fPW4q9FKjDBnMp/kF8E0bnPqaqfk8wevPpMUGcrI4b02WfUrntHTKr+dRzHbG/tlURLE909Jmsc23ujr8ngudok9llp8kspWshmrDAyMMUgS/Rv+bzl4BpJ6JBheDKJXMkwxkcuT4dNkPhbN/QVlQMrtkqIUF79dqPgFt2lU2tPmJ7+5wKhDaH9Y+CJzVrTQF7e1gNX+PdRkSroAHKb+oJDewq+qnfGVrdeQhaLp6CEc4F1JGXQfGK0qgVHgnYRA57BCPEPHaZoGp2O6AbLfsWzNSxOGTyv8Q28jOWu3Kqdr9GN8WS/3FwXH1ulmQYiq8NDAbyt3UFupgmKInbpDajiX2rarmxdOUc17Y5Sefo6VrWN5UWX1wr+HamJ7AEOQMAp9tRav6TR2OmrRSIYbAqJZ/EB6WmTf/O4geshUmBAYEeYP1+DOqkTgQzGRzILyCIkG3JXz1cXtssPhVToGbm0Q55Y11PTl+JZQqXZpgfFFfzaVx9412WK32uG0kg2RReqxVE3l9uMcjTEqgPao95C5yNE5vWdpmNCnW7visERwww== nathan.j.morton@gmail.com" > /root/.ssh/authorized_keys
chmod 700 /root/.ssh/authorized_keys

apt-get remove docker docker-engine docker.io containerd runc
apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io


# dpkg -i /path/to/package.deb
# docker run hello-world

