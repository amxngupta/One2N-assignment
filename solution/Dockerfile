FROM alpine
LABEL maintainer="amangupta522@gmail.com"
LABEL version="v1"
LABEL description="This is a custom image with CURL installed"
#   Set Working directory
WORKDIR /root
RUN mkdir /root/metrics-data
#   Update repos and install curl
RUN apk update && apk add curl && apk upgrade