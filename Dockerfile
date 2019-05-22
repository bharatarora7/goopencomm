FROM golang:latest

# Copy the local package files to the container’s workspace.
# ADD . /go/src/github.com/bharatarora7/opencommapi
WORKDIR /go/src/github.com/bharatarora7
RUN cd /go/src/github.com/bharatarora7 \
    && git clone https://github.com/bharatarora7/opencommapi.git

RUN cd /go/src/github.com/bharatarora7/opencommapi
# Install our dependencies
RUN go get github.com/go-sql-driver/mysql  
RUN go get github.com/gin-gonic/gin


# Install api binary globally within container 
RUN go install github.com/bharatarora7/opencommapi

# Set binary as entrypoint
ENTRYPOINT /go/bin/opencommapi

# Expose default port (3000)
EXPOSE 3000 