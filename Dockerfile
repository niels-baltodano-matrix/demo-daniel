# create dockerfile for the project spring-boot-rest-service
FROM gradle:7.5-jdk18-alpine as build
WORKDIR /app
COPY . .
RUN gradle build -x test

# Multi-stage java 8 correto
FROM openjdk:18-jdk-alpine3.15
# set timezone spain
RUN apk add --no-cache tzdata && \
    ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime && \ 
    addgroup -S spring && adduser -S spring -G spring && \
    echo "spring ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/app.jar
RUN chown -R spring:spring /app
USER spring
ENTRYPOINT ["java", "-jar", "app.jar"]