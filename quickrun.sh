# Clean images and files
docker rm $(docker ps -qa) -f
docker rmi $(docker image ls -qa -f "dangling=true")

# Build and run webserver
docker build -t webserver .
docker run --name server -d -p 80:80 -p 443:443 webserver
docker exec -it server /bin/bash
