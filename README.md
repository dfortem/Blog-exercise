# BLOG APPLICATION

This project is an exercise to work on node.js and vue.js skills.

## Getting Started

To run the application through docker follow the following steps:

### Prerequisites

You need docker to be installed on your machine.

### Build the docker image

To build the docker image use the following command from the root folder: 
```
docker build -t <desiresd-name-for-image> .
```

### Execute the app

To execute the app, execute the following image:
```
docker run -p 8080:3001 -d <desiresd-name-for-image>
```
now you can go to http://localhost:8080 and check it out.
