# loopback-node-red-example
## Requirements
- NodeJS 4.2
- Mosquitto (running at localhost:1833) https://mosquitto.org/download/

## Installation
Build 
```bash
$ docker build -t lahirs2/loopback-node-red-example .
```
Run app
```bash
$ docker run -d --name loopback-node-red-example -p 3000:3000 lahirs2/loopback-node-red-example
```

Login to bash
```bash
$ sudo docker exec -i -t loopback-node-red-example /bin/bash
```
Kill Application Instance
```bash
$ docker rm -f loopback-node-red-example
```

## Testing
- Orchestration API (http://localhost:3000/api/test
- Sample Notes API (http://localhost:3000/api/Notes)
- API Explorer (http://localhost:3000/explorer
- Node Red Console (http://localhost/red

## Node Red Configuration
- config.json file location - <project-path>/.nodered/.config.json
- workflow files - <project-path>/.nodered/
