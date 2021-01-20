# ci-demo

Welcome to ci-demo!!!

## running

    mvn clean jooby:run

## building

    mvn clean package

## docker

     docker build . -t ci-demo
     docker run -p 8080:8080 -it ci-demo
