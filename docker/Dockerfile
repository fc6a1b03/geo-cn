FROM python:3 as builder
WORKDIR /code
COPY ./requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ===========================================

FROM python:3-slim
ENV TZ=Asia/Shanghai
WORKDIR /code
COPY --from=builder /usr/local/bin /usr/local/bin
COPY --from=builder /usr/local/lib/python3/site-packages /usr/local/lib/python3/site-packages
COPY ./main.py .
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y curl procps && rm -rf /var/lib/apt/lists/* && \
    chmod +x *
CMD sh update_and_restart.sh
