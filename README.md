# Swagger Modeller Dockerfile


## How to build the image

Open docker cli from Kitematic

```
docker build -t tylerlong/swagger_modeller:v1 .
```


## How to start the website

Create a container using the image created above.

In the container, run:

```
cd ~/src/ruby/swagger-modeller && service postgresql start && rails s -b 0.0.0.0
```

Create a port mapping so you can access container's 3000 port number from your host browser.

Let's say you've mapped host:9000 to container:3000

Then open http://localhost:9000 to visit the website.
