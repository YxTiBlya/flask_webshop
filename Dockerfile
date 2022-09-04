FROM python

WORKDIR /app
COPY . .

RUN pip install -r requerements.txt

CMD ["python", "app.py"]