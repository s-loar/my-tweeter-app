# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Useful Docker commands

build the image--
docker build --tag my-tweeter-app .

bring up the containers--
docker-compose up

Connect to the database server within shell--
docker exec -it my-tweeter-app_db_1 psql -U postgres

List docker processes running--
docker ps

Get more information, like the IP, of a container by its id--
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 0cd7670dfbf3

* ...
