FROM mcr.microsoft.com/openjdk/jdk:11-ubuntu AS builder
WORKDIR /build

# 그래들 파일이 변경되었을 때만 새롭게 의존패키지 다운로드 받게함.
COPY gradle gradlew build.gradle settings.gradle /build/
RUN /build/gradlew build -x test --parallel --continue > /dev/null 2>&1 || true

# 빌더 이미지에서 애플리케이션 빌드
COPY . /build
RUN /build/gradlew build -x test --parallel

FROM mcr.microsoft.com/openjdk/jdk:11-ubuntu

COPY --from=builder /build/build/libs/spring-freeboard-*.jar .
ADD ./spring-freeboard-*.jar /usr/src/myapp/spring-freeboard.jar

EXPOSE 8080

WORKDIR /usr/src/myapp
CMD ["java", "-jar", "./spring-freeboard.jar"]