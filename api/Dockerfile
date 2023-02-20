FROM python:3.10-alpine

RUN pip install --no-cache-dir --upgrade pip==23.0

COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

LABEL maintainer=$MAINTAINER

WORKDIR /app

COPY ./src .

CMD ["python", "-m" , "uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "3000"]
