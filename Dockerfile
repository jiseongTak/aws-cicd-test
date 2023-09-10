# Use a base image with OpenJDK 17 installed
FROM openjdk:17-alpine AS build

# Set the working directory in the container
WORKDIR /app

# Copy the build.gradle.kts and settings.gradle.kts files to the container
COPY build.gradle.kts settings.gradle.kts ./

# Copy the Gradle Wrapper script and wrapper properties to the container
COPY gradlew .
COPY gradle gradle

# Copy the source code to the container
COPY src ./src

# Build the application using Gradle
RUN chmod +x ./gradlew  # Make the Gradle Wrapper script executable
RUN ./gradlew build

# Create a new container using a lightweight base image
FROM openjdk:17-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the Gradle build container to the current directory in the container
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the port that the application listens on
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "app.jar"]