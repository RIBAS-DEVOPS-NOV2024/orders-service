FROM maven:3.9.5-eclipse-temurin-11 AS build

WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:11-jre-slim

WORKDIR /app
COPY --from=build /app/target/orders-service-example-0.0.1-SNAPSHOT.jar /app/orders-service-example-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENV APP_ARGS=${APP_ARGS}
CMD ["java", "-jar", "orders-service-example-0.0.1-SNAPSHOT.jar", "https://dz1xa3bms0.execute-api.us-east-1.amazonaws.com/main/payments", "https://dz1xa3bms0.execute-api.us-east-1.amazonaws.com/main/shipping", "https://dz1xa3bms0.execute-api.us-east-1.amazonaws.com/main/products"]
