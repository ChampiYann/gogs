FROM golang:1.18-bullseye

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt install -y elpa-magit
RUN apt install -y make git-all nodejs
RUN npm install -g less
RUN go install github.com/go-task/task/v3/cmd/task@latest

RUN useradd -m git
USER git
RUN mkdir /go/gogs
RUN mkdir /go/gogs-repositories

VOLUME [ "/go/gogs","/go/gogs-repositories" ]

WORKDIR /go/gogs
EXPOSE 3000/tcp

CMD task web --watch