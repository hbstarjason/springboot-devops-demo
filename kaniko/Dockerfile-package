FROM maven:3.5.0-jdk-8-alpine

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone

WORKDIR /project
ADD . /project

#RUN mvn package -Dmaven.test.skip=true
RUN mvn -B clean package -DskipTests
CMD ["mvn"]

# docker build -t hbstarjason/springboot-devops-demo:jar -f  Dockerfile-package .
# docker run hbstarjason/springboot-devops-demo:jar tail -f 