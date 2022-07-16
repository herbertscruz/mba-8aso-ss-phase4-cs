#!/bin/bash

podman login quay.io

podman build --tag local:official-httpd -f ./Dockerfile

podman run -d --name official-httpd -p 8180:80 --rm local:official-httpd

podman commit -a 'RM-342971 - Herberts da Silva Cruz Fortuna' official-httpd do180-custom-httpd

podman tag do180-custom-httpd quay.io/herberts_cruz/do180-custom-httpd:v1.0

podman push quay.io/herberts_cruz/do180-custom-httpd:v1.0