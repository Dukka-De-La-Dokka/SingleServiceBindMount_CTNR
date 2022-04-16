# Basic libraries for frontend dev are already included (such as yarn, gcc, g++, make, python, python3...)
FROM node:16.14.2
# Project repository will be created inside app directory
WORKDIR /home/node/gatsby
# Update
RUN apt-get update && apt-get upgrade -y
# Expose port for app development
EXPOSE 8000 9000
