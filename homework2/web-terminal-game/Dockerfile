FROM python:alpine

RUN apk update && apk upgrade && apk add git
RUN pip install tornado

RUN git clone https://github.com/paradoxxxzero/butterfly.git
RUN git clone https://github.com/lanhel/pywumpus.git 

CMD python /butterfly/butterfly.server.py --host=0.0.0.0 --port=57575 --unsecure --i_hereby_declare_i_dont_want_any_security_whatsoever
