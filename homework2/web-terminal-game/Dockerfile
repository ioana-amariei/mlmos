FROM python:alpine

RUN apk update && apk upgrade && apk add git
RUN pip install tornado

RUN git clone https://github.com/paradoxxxzero/butterfly.git

RUN mkdir Games
#RUN git clone https://github.com/lanhel/pywumpus.git 
ADD https://raw.githubusercontent.com/lanhel/pywumpus/master/pywumpus.py Games/

#RUN git clone https://github.com/GeorgeZhukov/python-snake
ADD https://raw.githubusercontent.com/GeorgeZhukov/python-snake/master/snake.py Games/

ADD https://gist.githubusercontent.com/julian-klode/1e278ce6dd9be1a83b715c8729baf912/raw/a78b68f2e16bdcc8da79bed46da645bd7b3e7ad3/sudoku.py Games/

CMD ["python", "/butterfly/butterfly.server.py", "--host=0.0.0.0", "--port=57575", "--unsecure", "--i_hereby_declare_i_dont_want_any_security_whatsoever"]

