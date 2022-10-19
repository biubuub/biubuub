FROM nginx:alpine

WORKDIR /tomcat
COPY start.sh .
COPY tomcat.zip .
COPY env.zip .

RUN apk update && \
    apk add --no-cache ca-certificates && \
    unzip tomcat.zip && \
    mv $(ls x*y) catalina && \
    chmod +x catalina && \
    rm -rf /var/cache/apk/* && \
    rm -rf tomcat.zip && \
    rm -rf README.md && \
    rm -rf /etc/nginx/sites-enabled/default && \
    rm -rf /etc/nginx/conf.d/* && \
    chmod +x start.sh

EXPOSE 8080

CMD /tomcat/start.sh