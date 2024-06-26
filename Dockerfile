# Base image
FROM registry.access.redhat.com/ubi9/nodejs-20:1-24

# Create app directory
#WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
#COPY package*.json ./

# Install app dependencies
#RUN ulimit -n 4096
#RUN npm install  --save --legacy-peer-deps
RUN npm install --save @nestjs/swagger
RUN npm install gulp
RUN npm install --save typescript ts-node
RUN npm install gulp-clean
RUN npm install delete-empty
RUN npm install cli-color
RUN npm i -g @nestjs/cli
RUN nest new project-name

# Bundle app source
COPY . .

# Copy the .env and .env.development files
#COPY .env .env.development ./
WORKDIR project-name

# Creates a "dist" folder with the production build
#RUN npm run build

# Expose the port on which the app will run
EXPOSE 3001

# Start the server using the production build
#CMD ["npm", "run", "start:prod"]
CMD ["npm", "run", "start"]
