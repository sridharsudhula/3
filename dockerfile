FROM ubuntu:latest:latest
maintainer harish
RUN sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo \
    && sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key \
    && sudo yum install java-11-openjdk
    && sudo yum install git
    && sudo yum install vim
    && sudo yum install nano
