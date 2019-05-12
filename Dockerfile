# Use this file to compose a docker image using the commands 
# docker build -f Dockerfile -t YourImageName
# docker run -p 8080:3000 -d YourImageName


# use node version 10 over a alpine linux
# https://alpinelinux.org/ 
FROM node:carbon

RUN mkdir /dist
WORKDIR /dist

COPY package.json .
COPY .babelrc .
COPY src src
RUN npm install --save-dev @babel/core @babel/cli @babel/preset-env @babel/node
RUN npm install 
RUN npm run build

# expose at port 3000
EXPOSE 3000

# command to run using the script defined in package.json
CMD ["yarn", "start"]
