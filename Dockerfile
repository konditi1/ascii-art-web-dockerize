# Stage 1: Build stage
FROM golang:1.22.2-alpine AS build

# Set the working directory
WORKDIR /Ascii-web-app

# Copy the source code
COPY . .

# Build the Go application with CGO disabled and targeted for Linux.
# - CGO_ENABLED=0: Ensures the binary is statically linked, removing dependencies on C libraries,
#   which helps create a more portable and self-contained executable.
# - GOOS=linux: Cross-compiles the Go binary to run on Linux, making it suitable for deployment in
#   Linux-based Docker containers.
RUN CGO_ENABLED=0 GOOS=linux go build -o web-app .

# Set the entrypoint command
ENTRYPOINT ["/Ascii-web-app/web-app"]

# Stage 2: Final stage latest is more stable than edge
# but edge is more current
FROM alpine:latest

# Set the timezone and install CA certificates
RUN apk --no-cache add ca-certificates tzdata

# Set the working directory
WORKDIR /Ascii-web-app

# Copy the binary from the build stage
COPY --from=build /Ascii-web-app/web-app .

# Copy the static files and resources from the build stage
COPY --from=build /Ascii-web-app/static /Ascii-web-app/static
COPY --from=build /Ascii-web-app/resources /Ascii-web-app/resources
COPY --from=build /Ascii-web-app/template /Ascii-web-app/template

CMD ["./web-app"]
# Metadata as described below for tracking versions and contributors
LABEL docker-version="24.0.7"
LABEL golang_version="1.22.2"
LABEL contributors="james muchiri <jmuchiri> <mmjames451@gmail.com>,  jesee kuya <jkuya> <kuyajesee@proton.me>, fena onditi <fonditi> <konditi1@gmail.com>"

# FROM golang:1.22.2-alpine

# WORKDIR /Ascii-web-app

# COPY . . 

# RUN go build -o web-app .

# CMD [ "/Ascii-web-app/web-app" ]

# LABEL docker-version="24.0.7"
# LABEL golang_version="1.22.2"
# LABEL contributors="james muchiri <jmuchiri> <mmjames451@gmail.com>,  jesee kuya <jkuya> <kuyajesee@proton.me>, fena onditi <fonditi> <konditi1@gmail.com>"