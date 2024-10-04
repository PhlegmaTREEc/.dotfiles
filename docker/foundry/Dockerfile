# define base image
FROM node:18-alpine

# create user and directories
RUN adduser -D foundry
RUN mkdir -p /home/foundry/fvttapp
RUN mkdir -p /home/foundry/fvttdata

# commands
EXPOSE 30000
CMD ["node", "/home/foundry/fvttapp/resources/app/main.js", "--headless", "--dataPath=/home/foundry/fvttdata" ]
