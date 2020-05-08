FROM openjdk:8

ENV JAVA_OPTS=-javaagent:/usr/skywalking/agent/skywalking-agent.jar

ADD target/k8s.jar /opt/app.jar

# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom”,"-jar","/opt/app.jar"]
# CMD ["bash", "-c", "java ${JAVA_OPTS} -jar /opt/app.jar -Djava.security.egd=file:/dev/./urandom"]
CMD ["bash", "-c", "java  -jar /opt/app.jar -Djava.security.egd=file:/dev/./urandom"]
