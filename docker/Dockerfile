FROM python:3.9 as builder
WORKDIR /code
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ===================================================

FROM python:3.9-slim
ENV TZ=Asia/Shanghai
WORKDIR /code
Expose 80
COPY main.py *.mmdb .
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt-get clean && rm -rf /var/lib/apt/lists/* && ls -lah
ENTRYPOINT ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80", "--no-server-header", "--proxy-headers"]
