FROM python:3.10.12-alpine3.18

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY src /app

CMD /app/app.py