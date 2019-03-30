FROM python:alpine

RUN apk update && apk upgrade && apk add git

RUN git clone https://gist.github.com/226af528b4bded9a1db2bbf55803d48c.git

RUN mv 226af528b4bded9a1db2bbf55803d48c/http_server.py /bin/

ENTRYPOINT ["python", "/bin/http_server.py"]
