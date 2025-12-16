# 1. Use an image that has the Java Development Kit (JDK)
FROM eclipse-temurin:21-jdk-alpine

# 2. Set the working directory inside the container to /app
WORKDIR /app

# 3. Copy your project files into the container
# This takes everything in your current folder and puts it into /app
COPY . .

# 4. Compile the code (Exactly matching your shell script)
# We recreate the 'out' directory and run your specific javac command
RUN mkdir -p out && \
    javac -d out \
    src/org/uob/a2/*.java \
    src/org/uob/a2/commands/*.java \
    src/org/uob/a2/gameobjects/*.java \
    src/org/uob/a2/parser/*.java \
    src/org/uob/a2/utils/*.java

# 5. Run the game (Exactly matching your shell script)
# We use CMD to specify the command that runs when the container starts
CMD ["java", "-cp", "out", "org.uob.a2.Game"]