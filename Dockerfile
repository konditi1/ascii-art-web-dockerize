FROM golang:1.22.2-alpine

WORKDIR /Ascii-web-app

COPY . . 

RUN go build -o web-app .

CMD [ "/Ascii-web-app/web-app" ]

LABEL docker-version="24.0.7"
LABEL golang_version="1.22.2"
LABEL contributors="james muchiri <jmuchiri> <mmjames451@gmail.com>,  jesee kuya <jkuya> <kuyajesee@proton.me>, fena onditi <fonditi> <konditi1@gmail.com>"