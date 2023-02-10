FROM openjdk:8
RUN echo 'Dockerfile INIZIO'

ARG JAR_FILE=./target
ARG WORKDIR=/app

RUN echo $JAR_FILE 

RUN echo 'JAR_FILE=${JAR_FILE}' ${JAR_FILE}

COPY ${JAR_FILE}/*  app.jar

RUN echo 'we are running some # of cool things'



COPY  ${JAR_FILE}/*.jar  ${WORKDIR}/appjar

 

CMD ["java","-jar","app.jar"]
ENTRYPOINT ["java","-jar","app.jar"]
EXPOSE 8084

FROM maven:3.8.2-jdk-8
WORKDIR /app
COPY . .
RUN mvn clean install

#RUN mvn spring-boot:run


#docker build -t myjpa .
#docker build -t image_name .

#RUN docker-compose up
