ARG MAVEN_VER
FROM maven:${MAVEN_VER} as builder
ENV TERM xterm
WORKDIR /root
COPY ./ ./
RUN export PATH=/usr/local/openjdk-8/bin:/opt/apache-maven/bin/:$PATH && mvn -s settings.xml -B dependency:go-offline
ARG MAVEN_VER
FROM maven:${MAVEN_VER}
WORKDIR /root
COPY --from=builder /root/.m2 /root/.m2
