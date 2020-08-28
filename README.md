# nginx-git-html


```
version: "3.3"
services:
  image-proxy:
    image: willnorris/imageproxy:v0.8.0
    ports:
    - "8082:8082"
    command:
    - "-contentTypes"
    - ""
    - "-addr"
    - "0.0.0.0:8082"
    - "-cache"
    - "memory:1000:10m"
    - "-scaleUp"
    - "true"
    entrypoint: /go/bin/imageproxy
  nginx-proxy:
    image: bdhwan/nginx-image-proxy:0.0.1
    ports:
        - "8080:80"
    depends_on: 
      - image-proxy
    environment:
      - TARGET_HOST=http:\/\/image-proxy:8082
      - SOURCE_HOST=https:\/\/storage.blob.core.windows.net

```