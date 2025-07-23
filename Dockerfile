FROM openjdk:17-jdk-slim

# Crée un répertoire de travail
WORKDIR /app

# Copie le jar dans le conteneur
COPY target/*.jar app.jar

# Commande de démarrage
ENTRYPOINT ["java", "-jar", "app.jar"]