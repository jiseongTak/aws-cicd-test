## JDK 17
#FROM openjdk:17-alpine
#
## 8080 포트로 배포
#EXPOSE 8080
#
## 작업 공간 이동
##WORKDIR /app
## Jar 파일 경로
#ARG JAR_FILE_PATH=/build/libs/*.jar
## Jar 파일 복제
#COPY ${JAR_FILE_PATH} app.jar
#
## Jar 실행
#ENTRYPOINT ["java", "-jar", "/app.jar"]

#FROM gradle:8.1.2-jdk8-alpine AS build
FROM gradle:8.1-jdk17-alpine as build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM openjdk:17-jdk-slim
EXPOSE 8080
COPY --from=build /home/gradle/src/build/libs/cicd-0.0.1-SNAPSHOT.jar /app/
RUN bash -c 'touch /app/cicd-0.0.1-SNAPSHOT.jar'
ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/cicd-0.0.1-SNAPSHOT.jar"]