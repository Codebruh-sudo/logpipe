FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

COPY test-logs.json /logs/test-logs.json

CMD ["curl", "-X", "POST", "http://otel-collector:4318/v1/logs", "-H", "Content-Type: application/json", "--data", "@/logs/test-logs.json"]
