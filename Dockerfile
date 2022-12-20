FROM python:3.10-alpine3.17

# ENV TZ Asia/Shanghai
# RUN apk add tzdata && cp /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# RUN apk add ca-certificates

COPY . /app

WORKDIR /app

RUN pip install --upgrade pip && pip install --user -r requirements.txt

EXPOSE 8080

CMD ["python", "main.py"]
