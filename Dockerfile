# Use imagem do JDK como base
FROM eclipse-temurin:17-jdk-alpine

# Cria o diretório de trabalho
WORKDIR /app

# Copia o arquivo JAR gerado pelo Maven
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 8081

# Executa a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
