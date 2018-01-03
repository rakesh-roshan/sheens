.PHONY: test prereqs

all: test

prereqs:
	which stringer || go get golang.org/x/tools/cmd/stringer
	which jsonenums || go get github.com/campoy/jsonenums

test: prereqs
	@cd core && go generate && go test
	@cd crew && go test
	@cd tools && go test
	@cd interpreters/goja && go test
	@cd cmd/patmatch && go test
	@cd cmd/mservice/storage/bolt && go test
	@cd cmd/mservice && go test
	@cd cmd/mexpect && go test # Requires mservice executable
	@cd cmd/spectool && go test
