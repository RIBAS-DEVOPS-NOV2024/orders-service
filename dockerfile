FROM openjdk:11-jre-slim

WORKDIR /app

COPY target/orders-service-example-0.0.1-SNAPSHOT.jar /app/orders-service-example-0.0.1-SNAPSHOT.jar

EXPOSE 8080

CMD ["java", "-jar", "orders-service-example-0.0.1-SNAPSHOT.jar"]
