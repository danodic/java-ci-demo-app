FROM maven:3.6.1-jdk-8-slim as build
WORKDIR /ci-demo
COPY pom.xml pom.xml
COPY src src
COPY conf conf
RUN mvn package

FROM openjdk:8-jdk-slim
WORKDIR /ci-demo
COPY --from=build /ci-demo/target/ci-demo-1.0.0.jar app.jar
COPY conf conf
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
