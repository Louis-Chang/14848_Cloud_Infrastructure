FROM jenkins/jenkins:latest

# bypass token
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"


# Pre-plugin-install
RUN jenkins-plugin-cli --verbose --plugins \
    configuration-as-code \
    cloudbees-folder \
    timestamper \
    workflow-aggregator \
    git \
    ldap \
    email-ext \
    ssh-slaves \
    github-branch-source \
    ws-cleanup \
    antisamy-markup-formatter \
    build-timeout \
    ant \
    pipeline-github-lib \
    matrix-auth \
    mailer \
    credentials-binding \
    gradle \
    pipeline-stage-view \
    pam-auth \
    dark-theme \
    sonar \
    maven-plugin

# COPY yaml files
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml

# set up ENV
ENV CASC_JENKINS_CONFIG /var/jenkins_home/jenkins.yaml