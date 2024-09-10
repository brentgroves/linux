# install **[Protobuf](https://www.geeksforgeeks.org/how-to-install-protobuf-on-ubuntu/)**

**[Ubuntu 22.04 Desktop](../../ubuntu22-04/desktop-install.md)**\
**[Ubuntu 22.04 Server](../../ubuntu22-04/server-install.md)**\
**[Back to Main](../../../README.md)**

## reference

```bash
sudo apt install protobuf-compiler
which protoc           
/bin/protoc

```bash
# Install protoc and golang plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
which protoc-gen-go-grpc      
/home/brent/go/bin/protoc-gen-go-grpc
which protoc-gen-go     
/bin/protoc-gen-go
protoc ./proto/userInfo.proto --go_out=. --go-grpc_out=.
# this command creates app/proto/*.go files
```

```
