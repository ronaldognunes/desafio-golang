FROM golang:alpine AS build
WORKDIR /app
COPY go.mod ./
COPY main.go ./
RUN CGO_ENABLED=0 go build -o /publish main.go

FROM scratch AS final
COPY --from=build /publish /app
ENTRYPOINT [ "/app" ]