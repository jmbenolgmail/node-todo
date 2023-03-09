###### Spanish Translation

# Node Todo App

El siguiente codigo construye una app con MongoDB y Angular. Simplemente a modo de ejemplo y como un tutorial.

Node, tecnologia de base en esta app, proveera la API RESTful. Angular proveera el frontendd y el acceso a la API y sus recursos.

MongoDB sera nuestra base de datos..

Este tutorial es parte de una serie de tutoriales en [scotch.io](http://scotch.io)

Cada branch representa un tutorial determinado.
- tut1-starter: [Crear una Single Page Ap con Node y Angular](https://scotch.io/tutorials/creating-a-single-page-todo-app-with-node-and-angular)
- tut2-organization: [Organizacoin de la APP y su esructure](https://scotch.io/tutorials/node-and-angular-to-do-app-application-organization-and-structure)
- tut3-services: [Controllers and Services](https://scotch.io/tutorials/node-and-angular-to-do-app-controllers-and-services)

## Modifica node todo app!

Si quieres modificar el comportamiento de node todo app:

1. Clona el repositorio: `git clone https://github.com/jmbenol/node-todo`
2. Ve al directorio: `cd node-todo`
3. Edita la aplicación
4. Crea tu propia imagen: `docker build . -t <repo>/<image>:<tag>`

## Despliega node todo app!

Si quieres desplegar node todo app:

1. Clona el repositorio: `git clone https://github.com/jmbenol/node-todo`
2. Ve al directorio: `cd node-todo`
3. Crea el fichero .env:
`MONGO_USERNAME=<username>`
`MONGO_PASSWORD=<password>`
`MONGO_PORT=27017`
`MONGO_DB=meanstacktutorials`
1. Despliega: `docker-compose up -d`

REQUIREMENTS: you need docker and docker-compose installed in your environment

## Prueba node todo app!

Si quieres probar node todo app con la herramienta cli:

1. Clona el repositorio: `git clone https://github.com/jmbenol/node-todo`
2. Ve al directorio: `cd node-todo/cli-tool`
3. Edita el HOST y PORT al inicio: `vi cli-tool.sh`
4. Ejecuta: `./cli-tool.sh [command]`
5. Uso:
`GET TODOS:   ./cli-tool.sh -g [table|txt|json]`
`ADD TODO:    ./cli-tool.sh -a description`
`DELETE TODO: ./cli-tool.sh -d id`
`TEST APP:    ./cli-tool.sh -t`

REQUIREMENTS: Esta herramienta ha sido probada en Ubuntu. Para usarla, necesitarás instalar los siguientes paquetes:
```
apt-get update
apt-get install -y git
apt-get install -y curl
apt-get install -y jq
apt-get install -y csvkit
apt-get install -y vim
```