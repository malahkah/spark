
FROM alpine/git
WORKDIR /app
git clone https://github.com/malahkah/spark -b safe_spark

# build
FROM maven
WORKDIR /usr/src/app
COPY pom.xml .
RUN mvn -DskipTests clean package
COPY . .
RUN mvn -B -e -o -T 1C verify


