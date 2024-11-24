# Etapa 1: Build da aplicação
FROM maven:3.9.5-eclipse-temurin-17 AS builder
WORKDIR /app

# Copia o código-fonte para o container
COPY . .

# Compila o código e cria o arquivo JAR
RUN mvn clean package -DskipTests

# Etapa 2: Runtime da aplicação
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app

# Copia o arquivo JAR gerado na etapa de build
COPY --from=builder /app/target/*.jar app.jar

# Porta exposta pela aplicação
EXPOSE 8080

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
