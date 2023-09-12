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

#FROM eclipse-temurin:17-jdk-alpine
#EXPOSE 8080
#COPY build/libs/*.jar app.jar
##COPY --from=build /home/gradle/src/build/libs/cicd-0.0.1-SNAPSHOT.jar /app/
##RUN bash -c 'touch /app/cicd-0.0.1-SNAPSHOT.jar'
##ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Djava.security.egd=file:/dev/./urandom","-jar","/app/cicd-0.0.1-SNAPSHOT.jar"]
#ENTRYPOINT ["java", "-jar", "app.jar"]


#FROM eclipse-temurin:17-jdk-alpine AS builder
#COPY gradlew .
#COPY gradle gradle
#COPY build.gradle.kts .
#COPY settings.gradle.kts .
#COPY src src
#RUN dos2unix ./gradlew
#RUN chmod +x gradlew
#RUN ./gradlew bootJar

#FROM eclipse-temurin:17-jdk-alpine
#COPY --from=builder build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]
#VOLUME /tmp

FROM eclipse-temurin:17-jdk-alpine
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} ./app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "./app.jar"]