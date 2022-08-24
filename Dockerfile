FROM 192.168.200.154:8131/repository/simple-webapp/alpine:latest

ENV PYTHONUNBUFFERED=1

RUN set -ex \
    && mkdir /app \
    && apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools

WORKDIR /app/

ADD . /app/

RUN pip install -r requirements.txt

CMD ["python", "/app/app.py"]
