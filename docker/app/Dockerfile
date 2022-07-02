# Basic libraries for frontend dev are already included (such as yarn, gcc, g++, make, python, python3...)
FROM node:16.15.1
# Project repository will be created inside app directory
WORKDIR /home/node/app
# Update
RUN apt-get update && apt-get upgrade -y
# Install vim & jq
RUN apt-get install vim jq -y
# Expose port for app development
EXPOSE 8000 9000
