FROM ubuntu:latest
maintainer besant
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz /opt
RUN tar -xzvf /opt/apache-tomcat-9.0.65.tar.gz
RUN mv /apache-tomcat-9.0.65 /opt/
COPY addressbook.war /opt/apache-tomcat-9.0.65/webapps
RUN apt update -y 
RUN apt install software-properties-common -y
RUN apt install git nano vim openjdk-11-jre -y
CMD ["/opt/apache-tomcat-9.0.62", "statup.sh"]
EXPOSE 8081
