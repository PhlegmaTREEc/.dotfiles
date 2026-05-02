FROM node:24-alpine

# Args passed from docker-compose.yml
ARG FOUNDRY_HOME
ARG FOUNDRY_DATA

# Create the directories where FoundryVTT will live
RUN mkdir -p ${FOUNDRY_HOME}
RUN mkdir -p ${FOUNDRY_DATA}

# Copy the FoundryVTT zip file from your host to the container directory
COPY foundryvtt.zip ${FOUNDRY_HOME}/

# Set the working directory to /home/foundry/app (as declared in the .env file)
WORKDIR "${FOUNDRY_HOME}"

# Unpack the FoundryVTT zip file
RUN unzip foundryvtt.zip

# Remove the zip file to save space
RUN rm -rf foundryvtt.zip
