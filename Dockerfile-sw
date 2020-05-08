# FROM openjdk:8
FROM hbstarjason/sw-base:6.1.0

ADD target/k8s.jar /opt/app.jar

# ENTRYPOINT ["java","-javaagent:/usr/skywalking/agent/skywalking-agent.jar -Dskywalking.agent.service_name=k8s-example -Djava.security.egd=file:/dev/./urandom”,"-jar","/opt/app.jar"]
 
# CMD ["bash", "-c", "java -javaagent:/usr/skywalking/agent/skywalking-agent.jar -jar /opt/app.jar -Dskywalking.agent.service_name=k8s-example  -Djava.security.egd=file:/dev/./urandom"]
CMD ["bash", "-c", "java -javaagent:/usr/skywalking/agent/skywalking-agent.jar -jar /opt/app.jar -Djava.security.egd=file:/dev/./urandom"]
