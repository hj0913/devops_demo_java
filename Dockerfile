FROM java:8-jre-alpine
LABEL author="jeffhuang"

ADD ./target/*.jar app.jar

ENV JAVA_OPTS=""
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar"]