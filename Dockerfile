FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY stream_app.py .

RUN python3 -m venv camenv && \
    . camenv/bin/activate && \
    pip install --upgrade pip && \
    pip install \
        numpy==1.24.4 \
        simplejpeg \
        opencv-python \
        flask \
        flask_cors

CMD ["/bin/bash", "-c", ". camenv/bin/activate && python3 stream_app.py"]
