# Update the base image to use Java 11
FROM eclipse-temurin:11-jdk
# Add a working directory
WORKDIR /app

# Copy the Maven configuration files
COPY pom.xml .
COPY mvnw .
COPY .mvn .mvn

# Copy the source code
COPY src src

# Build the application
RUN ./mvnw package -DskipTests

# Run the application
EXPOSE 8080
CMD ["java", "-jar", "target/tradepro-0.0.1-SNAPSHOT.jar"]