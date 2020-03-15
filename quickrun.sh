# Clean images and files
rm -r client
docker rm $(docker ps -qa) -f
docker rmi $(docker image ls -qa) -f

# Build and run webserver
docker build -t webserver .
docker run --name server -p 80:80 -p 443:443 webserver
docker cp server:/ssl/client .
# docker exec -it server /bin/bash
