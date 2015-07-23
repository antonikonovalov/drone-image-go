FROM bradrydzewski/base
WORKDIR /home/ubuntu
USER ubuntu
ADD golang.sh /etc/drone.d/
RUN wget http://golang.org/dl/go1.4.2.linux-amd64.tar.gz --quiet && \
			sudo tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz && \
			sudo chown -R ubuntu:ubuntu /usr/local/go && \
			rm go1.4.2.linux-amd64.tar.gz
ENV GOROOT=/usr/local/go
ENV GOPATH=/var/cache/drone
ENV PATH=$PATH:$GOROOT/bin
RUN go get gopkg.in/olivere/elastic.v2 && \
	go get github.com/antonikonovalov/grpc-geoip2/client && \
	go get github.com/tools/godep && \
	go get github.com/drone/config && \
	go get github.com/bitly/go-nsq && \
	go get github.com/robfig/cron && \
	go get code.google.com/p/go-uuid/uuid && \
	go get github.com/GeertJohan/go.rice && \
	go get github.com/dgrijalva/jwt-go && \
	go get github.com/gorilla/securecookie && \
	go get github.com/fiam/gounidecode/unidecode && \
	go get github.com/antonikonovalov/money && \
	go get github.com/stretchr/testify/mock && \
	go get github.com/nitrous-io/go-mixpanel && \
	go get github.com/Sam-Izdat/pogo && \
	go get github.com/garyburd/redigo/redis && \
    	go get github.com/vieux/gocover.io/server/redis 
