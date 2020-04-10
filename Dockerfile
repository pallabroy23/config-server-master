FROM maven:3.5-jdk-8
#ADD ["target/config-server-0.0.1-SNAPSHOT-exec.jar", "app.jar"]
COPY ./ ./
EXPOSE 8888 8787
ENV JAVA_OPTS="-Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=8787,suspend=n"
RUN mvn package -DskipTests=true
#RUN sh -c 'touch /app.jar'
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=docker -jar ./target/config-server-0.0.1-SNAPSHOT-exec.jar" ]
