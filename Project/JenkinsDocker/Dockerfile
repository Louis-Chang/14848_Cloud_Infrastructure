FROM jenkins/jenkins:lts

USER root

# Install necessary packages
RUN apt-get update && apt-get install -y unzip wget

# Download and install Sonar Scanner CLI version 4.6.2.2472
RUN wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.6.2.2472.zip -O /tmp/sonar-scanner-cli.zip \
    && unzip /tmp/sonar-scanner-cli.zip -d /opt \
    && rm /tmp/sonar-scanner-cli.zip \
    # Ensure the version matches the extracted directory name
    && ln -s /opt/sonar-scanner-4.6.2.2472/bin/sonar-scanner /usr/bin/sonar-scanner

# Configure Sonar Scanner to recognize your SonarQube server
RUN echo 'sonar.host.url=http://35.202.249.189:9000' >> /opt/sonar-scanner-4.6.2.2472/conf/sonar-scanner.properties

# Switch back to the jenkins user
USER jenkins