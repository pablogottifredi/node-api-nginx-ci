# Use this file to compose a docker image using the commands 
# docker build -f Dockerfile -t YourImageName
# docker run -p 8080:3000 -d YourImageName


# use node version 10 over a alpine linux
# https://alpinelinux.org/ 
FROM mhart/alpine-node:10

# set working directory, with code transpiled and minified
WORKDIR dist

# for developer purposes, adding nodemon for run the instance
RUN apk update && apk add nodejs && npm i -g nodemon
# transpiler to write code with ec6 support
RUN npm install @babel/core @babel/node --save-dev

# bundle the source code into the image
COPY . .

# expose at port 3000
EXPOSE 3000

# command to run using the script defined in package.json
CMD ["yarn", "build"]
