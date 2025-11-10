# -------------------------------------------------
# Stage 1: Build JAR with Maven
# -------------------------------------------------
FROM maven:3.9-eclipse-temurin:17 AS builder
WORKDIR /app

# Cache dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Build app
COPY src ./src
RUN mvn clean package -DskipTests -B

# -------------------------------------------------
# Stage 2: Runtime (tiny JRE)
# -------------------------------------------------
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copy JAR from builder
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
