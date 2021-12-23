FROM java:8
WORKDIR /app

ADD target ./

EXPOSE 8080

#CMD java -cp helloworld-1.1.jar com.pets.local.helloworld.HelloWorld
