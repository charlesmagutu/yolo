# Requirements
Make sure that you have the following installed:
- [node](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the mongodb service with `sudo service mongod start`

## Navigate to the Client Folder 
 `cd client`

## Run the folllowing command to install the dependencies 
 `npm install`

## Run the folllowing to start the app
 `npm start`

## Open a new terminal and run the same commands in the backend folder
 `cd ../backend`

 `npm install`

 `npm start`

 ### Go ahead a nd add a product (note that the price field only takes a numeric input)

 # Running YOLO as a Docker Container
    This guide will walk you through the steps to set up and run the YOLO application using Docker Compose. The application consists of frontend, backend, and database containers.

 ### Prerequisites

 - [Docker installed on your system]

### Running the Application
navigate to the directory containing the docker-compose.yml file and run the following command:
``` bash
docker-compose pull

```
This command will download the Docker images for all the services specified in the Docker Compose file. Once the images are pulled, you can proceed to run the application using Docker Compose.

```bash
docker-compose up -d

```
This command will start all the services defined in the Docker Compose file in detached mode (-d), allowing them to run in the background.
