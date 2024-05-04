# YOLO Application Setup Guide

## Requirements
Make sure that you have the following installed:
- [Node.js](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-18-04) 
- npm 
- [MongoDB](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/) and start the MongoDB service with `sudo service mongod start`

## Setting Up the Client
1. Navigate to the Client Folder: 
    ```bash
    cd client
    ```
2. Install the dependencies: 
    ```bash
    npm install
    ```
3. Start the application:
    ```bash
    npm start
    ```

## Setting Up the Backend
1. Open a new terminal and navigate to the backend folder:
    ```bash
    cd ../backend
    ```
2. Install the dependencies:
    ```bash
    npm install
    ```
3. Start the backend server:
    ```bash
    npm start
    ```

## Adding a Product
1. With both the client and backend servers running, go ahead and add a product. Note that the price field only takes a numeric input.

# Running YOLO as a Docker Container
This guide will walk you through the steps to set up and run the YOLO application using Docker Compose. The application consists of frontend, backend, and database containers.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) installed on your system

## Running the Application
1. download docker compose file from github
    ```shell
    curl -O https://raw.githubusercontent.com/charlesmagutu/yolo/master/docker-compose.yaml
    ```
2. Navigate to the directory containing the `docker-compose.yml` file:
    ```shell
    cd path/to/your/docker-compose.yaml
    ```
3. Pull the Docker images for all services specified in the Docker Compose file:
    ```shell
    docker-compose pull
    ```
4. Start all services defined in the Docker Compose file in detached mode:
    ```shell
    docker-compose up -d
    ```