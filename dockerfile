FROM ubuntu:latest
maintainer besant
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz /opt
RUN tar -xzvf /opt/apache-tomcat-9.0.62.tar.gz
RUN mv /apache-tomcat-9.0.62 /opt/
COPY demo.war /opt/apache-tomcat-9.0.62/webapps
RUN apt update -y 
RUN apt install software-properties-common -y
RUN apt install git nano vim openjdk-11-jre -y
CMD ["/opt/apapache-tomcat-9.0.62/bin", "startup.sh"]
EXPOSE 555
