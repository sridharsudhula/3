rm -rf newimages
mkdir -m 777 newimages
cd newimages
touch dockerfile
cp /var/lib/jenkins/workspace/demo-app/target/demo.war .
echo "
FROM centos:latest
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install java-1.8.0-openjdk git nano vim -y
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz /opt/
RUN tar -zxvf /opt/apache-tomcat-9.0.62.tar.gz
COPY demo.war /opt/apache-tomcat-9.0.62/webapps
CMD ["/opt/apache-tomcat-9.0.62/bin", "startup.sh"
EXPOSE 8088" >> dockerfile
sudo docker build -t demo-company:v1 .
