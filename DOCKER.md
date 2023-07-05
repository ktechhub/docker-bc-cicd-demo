# Docker
Docker is a popular containerization platform that allows developers to package and deploy applications in a lightweight, isolated environment.

## Installing Docker
The first step is to install Docker on your computer. You can download the latest version of Docker from the official website [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

Or find installation guide here:

```sh
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt install docker-ce
sudo systemctl status docker
```

### Executing the Docker Command Without Sudo (Optional)
By default, the docker the command can only be run by the root user or by a user in the docker group, which is automatically created during Docker’s installation process. If you attempt to run the docker command without prefixing it with sudo or without being in the docker group, you will get an error. If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:

```sh
sudo usermod -aG docker ${USER}
sudo su - ${USER}
```

Add a specific user

```sh
sudo usermod -aG docker username
```

## Running your first container

To run your first Docker container, you will need to have Docker installed on your computer. Once Docker is installed, you can run a container by pulling an image from a registry and running it. For example, to run the official "hello-world" image, you can run the following command:

```sh
docker run hello-world
```
This will pull the "hello-world" image from the Docker Hub registry and run it as a container. The container will execute a simple program that prints a message and then exits.

### Building containers

To build a Docker container, you will need to create a Dockerfile that contains the instructions for building the container. A Dockerfile is a text file that specifies the base image to use, the files and dependencies to include in the image, and the command to run when the container starts.

For example, the following Dockerfile specifies a base image (Python 3.9), copies the project files into the image, installs the dependencies from a "requirements.txt" file, and sets the command to run when the container starts:

```Dockerfile
FROM python:3.9

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools wheel

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```
To build the Docker image, you can run the following command:
```sh
docker build -t demo-fastapi .
```
Replace "demo-fastapi" with the desired name for your image. This will build the image based on the instructions in the Dockerfile.

Building by specify the exact file

```sh
docker build -t demo-fastapi . -f <path-to-docker-file>
```

## Docker Containers
A Docker container is a lightweight, isolated environment that allows you to run applications in a predictable and consistent way, regardless of the host environment. Containers are built from Docker images, which are templates that contain the code, libraries, and dependencies needed to run the application.

Containers are isolated from each other and the host environment, which makes them an ideal solution for deploying applications in development, staging, and production environments. They are lightweight and fast to start, and they can be easily moved between different hosts or environments.

### Running containers
To run a Docker container, you will need to have a Docker image built and available on your machine. You can then use the docker run command to run the container. For example:

```sh
docker run  --name mycontainer -d -p 8000:8000 demo-fastapi
```

This will run the container in detached mode (-d) and expose the container's port 8000 to the host's port 8000 (-p 8000:8000).

### Remove container
To remove a Docker container, you can use the docker rm command. For example:

```sh
docker rm mycontainer
```

Replace "mycontainer" with the name or ID of the container you want to remove.

If it a running container then you would have to `force` delete it.

```sh
docker rm mycontainer -f
```

## Docker Compose
```sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

Run apps
```sh
docker-compose up -d
```

Down
```sh
docker-compose down
```

Run db_test
```sh
python db_test.py
```
