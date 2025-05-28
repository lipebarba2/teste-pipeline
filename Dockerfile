# Etapa 1: Build com Maven Wrapper
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app

# Copia os arquivos do projeto
COPY . .

# Dá permissão para o script mvnw
RUN chmod +x mvnw


# Empacota o projeto (sem rodar testes)
RUN ./mvnw clean package -DskipTests

# Etapa 2: Runtime
FROM eclipse-temurin:21-jdk
WORKDIR /app

# Copia o JAR da build anterior
COPY --from=build /app/target/*.jar app.jar

# Exponha a porta padrão da aplicação
EXPOSE 8081

# Comando para iniciar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
