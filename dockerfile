FROM maven:3.8.3-openjdk-17 AS maquinabuild

COPY . .

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

COPY --from=maquinabuild /target/pratica-0.0.1-SNAPSHOT.jar teste.jar
EXPOSE 8090
ENTRYPOINT ["java","-jar", "teste.jar"]