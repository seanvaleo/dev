## make check: Perform all checks
check: fmt vet test

## make install: Perform unit tests, then build and install software
install: test
	go build -i -o $(GOPATH)/bin/app cmd/main.go

## make vet: Perform go vet
check: 
	go vet ./...

## make check: Perform all checks
fmt:
	go fmt ./...

## make test: Perform unit tests
test:
	go test -p 1 -failfast -timeout 300s ./internal/...

## make bench: Perform unit tests and benchmark tests
bench: test
	go test -p 1 -failfast -timeout 300s -bench=. -benchtime=1000x -run=Benchmark ./internal/...
	
## make cover: Perform coverage analysis for unit tests
cover: 
	go fmt ./...
	go vet ./...
	go test -p 1 -coverprofile=coverage.out -timeout 300s ./...
	go tool cover -func=coverage.out
	go tool cover -html=coverage.out
	rm coverage.out

## make help: See a list of available commands
help: makefile
	@echo
	@echo Available commands:
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo
