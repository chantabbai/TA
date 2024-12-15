# Update the base image to use Java 11
FROM eclipse-temurin:11-jdk

# Install Maven
RUN apt-get update && \
    apt-get install -y maven

# Add a working directory
WORKDIR /app

# Copy the pom.xml file
COPY pom.xml .

# Copy the source code
COPY src src

# Build the application
RUN mvn package -DskipTests

# Run the application
EXPOSE 8080
CMD ["java", "-jar", "target/tradepro-0.0.1-SNAPSHOT.jar"]