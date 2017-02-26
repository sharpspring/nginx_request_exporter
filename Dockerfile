FROM scratch
COPY nginx_request_exporter /nginx_request_exporter
ENTRYPOINT ["/nginx_request_exporter"]
