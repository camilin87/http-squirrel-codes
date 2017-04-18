# Development instructions  

## Prerequisites  

- Go

Set the `GOPATH`  

    export GOPATH=$PWD

## Generating a manifest  

Building the library  

    go build local/stringutil && go test local/stringutil

Running the tool  

    go install local/squirrel-page-builder && $GOPATH/bin/squirrel-page-builder

Cleanup  

    rm -Rf pkg bin

TODO

## Downloading all the images  

TODO

## Generating the pages  

TODO

## Documentation  

https://golang.org/doc/code.html
