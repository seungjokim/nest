ARG baseImageVersion=18.18.2-1
ARG builderVersion=1-24
ARG yarnVersion=1.22.5
ARG appDir=/usr/app/src
ARG distDir=/usr/app/dist
ARG runnerWorkDir=/opt/app-root/src

#######################
##### build image #####
#######################
FROM registry.access.redhat.com/ubi9/nodejs-20:${builderVersion} as builder

ARG appDir
#ARG distDir

WORKDIR ${appDir}

# copy package.json & yarn.lock first to cache
COPY package.json package-lock.json ./

RUN npm install

# install node_modules
#RUN npm --frozen-lockfile --prefer-offline --silent

# copy source code
COPY . .

# build app
RUN nest build

# remove devDependencies
#RUN npm --frozen-lockfile --prefer-offline --silent --prod

# expose port
EXPOSE 3000

# set NODE_ENV
ENV NODE_ENV=production

# start server
CMD node dist/main.js
