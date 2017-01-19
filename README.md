# Swagger Modeller Dockerfile


## How to build the image

Open docker cli from Kitematic

```
docker build -t tylerlong/swagger_modeller:v1 .
```

A docker image named `swagger_modeller` will be created.


## How to start the website

Start Kitematic

Create a container using the image created above.

Check the container's ports settings, let's say 192.168.99.100:32768 is mapped to container:3000

In the container, run:

```
cd ~/src/ruby/swagger-modeller && service postgresql start && rails s -b 0.0.0.0
```

Then open http://192.168.99.100:32768 to visit the website.
