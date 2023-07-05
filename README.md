# Bootcamp - Docker

Just demo app...

## Setup
Create a virtual environment and install the necessary requirements.

```sh
cp .env.example .env && \
python3 -m venv venv && \
source venv/bin/activate && \
pip install --upgrade pip && \
pip install --no-cache-dir --upgrade -r requirements.txt
```

## Run App
```sh
uvicorn main:app --reload
```

## Docker
### Build App
```sh
docker build -t demo-fastapi:latest .
```

### Run container
```sh
docker run  --name demo-fastapi -d -p 8000:8000 demo-fastapi:latest
```

### Remove app
```sh
docker rm demo-fastapi --force
```

## Makefile
### setup
```sh
make setup
```
### run app
```sh
run-app
```
### build app
```sh
make build
```
### run app
```sh
run
```
### destroy
```sh
make destroy
```
### build-run
```sh
make build-and-run
```

## Spin a MySQL Database
```sh
docker run --name mysql -d \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD=password \
    -e MYSQL_USER=test \
    -e MYSQL_PASSWORD=password \
    -e MYSQL_DATABASE=test \
    mysql:latest
```

## Test db app
```sh
sudo apt install libmysqlclient-dev python-dev -y
pip3 install mysql-connector-python
```
### Work with MySQL Connector
[https://www.w3schools.com/python/python_mysql_getstarted.asp](https://www.w3schools.com/python/python_mysql_getstarted.asp)

Test DB
```sh
python db_test.py
```