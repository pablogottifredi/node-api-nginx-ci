# Use this file to compose a docker image using the commands 
# docker build -f Dockerfile -t YourImageName
# docker run -p 8080:3000 -d YourImageName


# use node version 10 over a alpine linux
# https://alpinelinux.org/ 
FROM node:carbon

COPY package.json .
RUN yarn 

# set working directory, with code transpiled and minified
WORKDIR /dist

COPY . .

# expose at port 3000
EXPOSE 3000

# command to run using the script defined in package.json
CMD ["yarn", "start"]