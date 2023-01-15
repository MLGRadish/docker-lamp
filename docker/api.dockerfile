FROM alpine:3.17

RUN apk add --no-cache \
   uwsgi-python3 \
   python3 \
   py3-pip

RUN pip install wheel flask flask-sqlalchemy python-dotenv pymysql

CMD [ "uwsgi", "--socket", "0.0.0.0:8000", \
   "--uid", "uwsgi", \
   "--plugins", "python3", \
   "--protocol", "uwsgi", \
   "--py-autoreload", "1", \
   "--enable-threads", \
   "--wsgi", "wsgi:app" ]
