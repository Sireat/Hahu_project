# Use the official Golang image
FROM golang:1.18-alpine

# Set the Current Working Directory inside the container
WORKDIR /go/src/app

# Copy everything from the current directory to the PWD (Present Working Directory) inside the container
COPY . .

# Install necessary dependencies
RUN apk add --no-cache git
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Install Go dependencies
RUN go mod tidy

# Expose port 8082 to the outside world
EXPOSE 8082

# Set environment variables
ENV GOPROXY=https://proxy.golang.org,direct

# Command to run the Go program
CMD ["dlv", "debug", "--listen=:8082", "--headless=true", "--api-version=2", "--log=true", "--accept-multiclient", "exec", "./main"]
