FROM tomcat:latest
MAINTAINER prathap preddydevops5@gmail.com
COPY prathap-1.war /usr/local/tomcat/webapps
EXPOSE 8080
