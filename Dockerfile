FROM python

WORKDIR /app
COPY . .

ADD ./wait-for-it.sh /wait-for-it.sh

RUN pip install -r requerements.txt

CMD ["python", "app.py"]