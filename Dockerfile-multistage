### https://docs.docker.com/develop/develop-images/multistage-build/

FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
COPY pom.xml /build/
COPY src /build/src/
WORKDIR /build/
RUN mvn -B clean package -DskipTests

# FROM openjdk:8-jdk-alpine AS MAVEN_BUILD
# COPY mvnw .
# COPY .mvn .mvn
# COPY pom.xml /build/
# COPY src /build/src/
# WORKDIR /build/
# RUN mvn -B clean package -DskipTests

FROM openjdk:8
#FROM openjdk:8-jre-alpine

ENV JAVA_OPTS=-javaagent:/usr/skywalking/agent/skywalking-agent.jar
#ADD target/k8s.jar /opt/app.jar
COPY --from=MAVEN_BUILD  /build/target/k8s.jar /opt/app.jar

CMD ["bash", "-c", "java  -jar /opt/app.jar -Djava.security.egd=file:/dev/./urandom"]
