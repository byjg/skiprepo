FROM maven:3.3-jdk-8 as builder
WORKDIR /usr/src/mymaven
COPY src /usr/src/mymaven/src
COPY pom.xml /usr/src/mymaven/
RUN mvn clean install

FROM jetty:latest as runner
COPY --from=builder /usr/src/mymaven/target/hello-world-war-1.0.0 /var/lib/jetty/webapps/ROOT
CMD ["java","-jar","/usr/local/jetty/start.jar"]


