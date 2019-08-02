FROM golang:1.12 as build


COPY . /go/src/oauth2_proxy
RUN curl -s https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

WORKDIR /go/src/oauth2_proxy

RUN ./dist.sh && cd ./dist && tar -xzvf oauth2_proxy*linux* && rm *tar.gz && ln -s oauth2_proxy*linux*/oauth2_proxy*linux* oauth2_proxy

FROM golang:1.12
COPY --from=build /go/src/oauth2_proxy/dist/ /go/bin/

ENTRYPOINT ["oauth2_proxy"]
