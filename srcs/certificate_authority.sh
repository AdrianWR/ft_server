#!/bin/bash

# This script runs the openssl utility to generate
# SSL credentials to be used on a $SERVER_KEY environment.

# At first, it generates the certificate-key pair to
# the certificate authority, to be used by the client.
# Then, the certificate-key pair is generated and signed
# to be used by the server. If you're running the server
# on a Docker container, for example, you can COPY the 
# '$SERVER.*' files to the image and point the location
# on the server configuration.

# The client certificates can be acessed by the host machine
# through a persistent Docker volume, which should be mounted
# on /ssl/client, or by copying its contents to a host directory.

SSL_DIR=/ssl
CLIENT_DIR=$SSL_DIR/client
SERVER_DIR=$SSL_DIR/server
mkdir -p $CLIENT_DIR
mkdir -p $SERVER_DIR

COMMON_NAME=server
CLIENT=$CLIENT_DIR/client
SERVER=$SERVER_DIR/$COMMON_NAME

# Client certificate-key pair generation
openssl req -x509 -nodes -new -sha256 \
	-days	1024 \
	-newkey	rsa:2048 \
	-keyout $CLIENT.key \
	-out	$CLIENT.pem \
	-subj	"/C=BR/CN=FT Server Corps. Inc. Trust Services"
openssl x509 -outform pem -in $CLIENT.pem -out $CLIENT.crt

# Server certificate-key pair generation
openssl req -new -nodes \
	-newkey rsa:2048 \
	-keyout $SERVER.key \
	-out $SERVER.csr \
	-subj "/C=BR/ST=São Paulo/L=São Paulo/O=FT Server Corps. Inc./CN=$COMMON_NAME"

# Client-server certificate-key pair authentication
openssl x509 -req -sha256 \
	-days 1024 \
	-in $SERVER.csr \
	-CA $CLIENT.pem \
	-CAkey $CLIENT.key \
	-CAcreateserial \
	-extfile /tmp/domains.ext \
	-out $SERVER.crt

rm $SERVER.csr
