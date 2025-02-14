# Use an official OpenJDK 17 runtime as the base image
FROM openjdk:17

# Set the working directory inside the container

# Copy the JAR file into the container
ADD target/rps-0.0.1-SNAPSHOT.jar rps-0.0.1-SNAPSHOT.jar


# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "/rps-0.0.1-SNAPSHOT.jar"]