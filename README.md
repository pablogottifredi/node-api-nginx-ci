# Boilerplate NodeJS + Nginx Api 

A boilerplate api server in nodeJS with a nginx as a proxy and pre compilled commands to prepare code to dist.  
Aditionally a swagger configuration and unit test & ci test examples.  

## Desing approach 
Applying concepts of [12-factor-app](https://12factor.net/) this boilerplate api was designed with the purpose that you can start quickly coding a solution ready to use in a ***real world***

### Some concepts applied (5/12)
* ***Dev/Prod parity***:  
   Without additionals local instalation to run, OS independence, only you need docker && docker-compose 
* ***Port binding***:  
   As a self container application based in a NodeJS server, that solve the port exposition of the app under http server  
   You must only put your code (Javascript) into the ***./src*** folder and the preconfigured instances solve the rest   
   You can configure the port map into ***docker-compose.yml*** or ***Dockerfile***. 
* ***Config***:  
   Ready to setup using ***.env*** file.  
* ***Dependencies***:  
   Ready to setup additional dependencies in ***package.json*** file
* ***Stateless process***:  
   API endpoints without state.

### Pending (6/12)
* Build,release,run
* Disposability
* Logs
* Backing service
* Scalling (Concurrency)
* Admin Process

### Non-visible concepts in the code (1/12)
* Codebase mantain

### Architecture and sofware enginering process
* Swagger to expose the API documentation
* Nginx configuration and proxy pattern to map endpoint
* A POD with api code, nginx proxy
* TDD ready with code sample

### Other non relevant process
* Trasliteration using babel to use some language features

### Pending to solve
- [ ] Adding to POD a non-sqlDatabase
- [ ] Implement an example of backing service using a facade pattern
- [ ] Implement an example of stateles using data session under using a Redis
- [ ] Add configuration to extract log from console, and solve storage
- [ ] Configure a get variables from a config map for kubernetes
- [ ] Implement entire yaml script to mount cluster into a kubernetes container
- [ ] Implement autoscalling script
- [ ] Solve all pipelines to deploy
- [ ] Finish versioning implementation script and colibry deploy
- [ ] Solve localhost configuration to developer use   
- [ ] Up to node:alpine
- [ ] Up node engine
- [ ] Swagger

## Getting Started

### Previous requirements
* [Docker CE version 18.09.04 or up](https://docs.docker.com/install/linux/docker-ce/ubuntu/) 
* [Docker Compose version 1.24.0 or up](https://docs.docker.com/compose/install/) 
* [Yarn version 1.15.2 or up](https://yarnpkg.com/lang/en/docs/install/#debian-stable)
* [Git client](https://git-scm.com/)

### Clone or manage your code in Fork of the original reposiory
You can use simply doing a clone of the repo and using into a local environment
```
git clone https://github.com/pablogottifredi/node-api-nginx-ci.git
```
But, this is not your place to made push request, so, you must make a Fork of the project, you can follow an step by step instruction [here](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/)  
Follow the steps:
```
* Making a local clone
$ git clone https://github.com/pablogottifredi/node-api-nginx-ci.git
* Adding a Remote
$ git remote add upstream https://github.com/pablogottifredi/node-api-nginx-ci.
* Create a [Branch](https://12factor.net/codebase)
$ git checkout -b my-branch/my-feature
```

## Setup
### 1. Config host 
Setup your /etc/host file to resolve in local enviroment
```
127.0.0.1 base-api-node 
```
Warning!! with [DNS cache](https://beebom.com/how-flush-dns-cache-linux/) or browser [hardware acceleration](https://www.google.com/search?q=use+hardware+acceleration+when+available)

### 2. Config enviroment
Setup enviroment runnign
```
  yarn setup 
```

### 3. Build  

The project provide a ***Makefile*** to configure the application and use under several scenarios 
```
 make <param>
```
i.e
```
    make watch
```
##### List of params

* `build`: setup enviroment, build code, traspile and minify. Put the source in dist folder and launch the server.  
* `watch`: running the code from the src folder for run-in-time debugging and test the changes 
* `down`: stop intizalized containers 
* `clean`: delete all images and container from memory

### 4. Test
In your browser test the address
``` 
open in your browser http://base-api-node:8080/
```
or make a GET using curl
```
$ curl -G base-api-node:8080
```

## Change code or config
When your run the project using watch you can change the source code directly in the ***./scr*** folder  
The file docker-compose.yml was configured to map the folder into the container

Additionaly you have the nginx.conf for the api into the ***./nginx*** folder.  
The changes are not reloaded automatically, ***you must restart the nginx using***
#### For restart nginx
```
$ docker exec -ti CONTAINER_ID sh
service nginx restart
```

## About the infrastructure
The command make build || make watch mount the follow infrastructure

* [A Container with node:carbon from docker hub](https://hub.docker.com/r/mhart/alpine-node/)
* [A Nginx lastet version from docker hub](https://hub.docker.com/_/nginx)
* The application **Base-api-node** with the source code transpiled into the /dist folder using [babel](https://babeljs.io/docs/en/babel-node) to support EC6 syntax and [nodemon](https://www.npmjs.com/package/nodemon) to restart the server when detect changes in the source code. 


