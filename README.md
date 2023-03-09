# Node Todo App

A Node app built with MongoDB and Angular and bash cli tool for testing purposes.

Node provides the RESTful API. Angular provides the frontend and accesses the API. MongoDB stores like a hoarder.

This repo corresponds to the Node Todo Tutorial Series on [scotch.io](http://scotch.io)

Each branch represents a certain tutorial.
- tut1-starter: [Creating a Single Page Todo App with Node and Angular](https://scotch.io/tutorials/creating-a-single-page-todo-app-with-node-and-angular)
- tut2-organization: [Application Organization and Structure](https://scotch.io/tutorials/node-and-angular-to-do-app-application-organization-and-structure)
- tut3-services: [Controllers and Services](https://scotch.io/tutorials/node-and-angular-to-do-app-controllers-and-services)

## Modify node todo app!

If you want to modify the node todo app:

1. Clone the repository: `git clone https://github.com/jmbenol/node-todo`
2. Move to directory: `cd node-todo/docker`
3. Edit nodejs app
4. Build your own image: `docker build . -t <repo>/<image>:<tag>`

## Deploy node todo app!

If you want to deploy the node todo app:

1. Clone the repository: `git clone https://github.com/jmbenol/node-todo`
2. Move to directory: `cd node-todo/docker`
3. Create .env file: `vi .env`
```
MONGO_USERNAME=<username>
MONGO_PASSWORD=<password>
MONGO_PORT=27017
MONGO_DB=meanstacktutorials
```
4. Run: `docker-compose up -d`

REQUIREMENTS: you need docker and docker-compose installed in your environment

## Test node todo app!

If you want to test the node todo app with cli tool:

1. Clone the repository: `git clone https://github.com/jmbenol/node-todo`
2. Move to directory: `cd node-todo/cli-tool`
3. Edit HOST and PORT variables: `vi cli-tool.sh`
4. Execute: `./cli-tool.sh [command]`
5. Usage:
```
GET TODOS:   ./cli-tool.sh -g [table|txt|json]
ADD TODO:    ./cli-tool.sh -a description
DELETE TODO: ./cli-tool.sh -d id
TEST APP:    ./cli-tool.sh -t
```

REQUIREMENTS: It has been tested in Ubuntu. You will need to install following tools
```
apt-get update
apt-get install -y git
apt-get install -y curl
apt-get install -y jq
apt-get install -y csvkit
apt-get install -y vim
```