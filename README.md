# VTS-IPCamera Docker Image Guide

Docker 이미지를 빌드하고 GHCR(GitHub Container Registry)에 업로드 및 사용하는 방법을 정리

---

## 📦 1. Docker 이미지 빌드

현재 디렉토리에 `Dockerfile`, `install_camera.sh`, `stream_app.py` 파일이 있다고 가정합니다.

```bash
docker build -t vts-ipcamera-container .
```

---

## 🔐 2. GHCR 로그인

GitHub Personal Access Token으로 GHCR에 로그인합니다.

```bash
echo <YOUR_TOKEN> | docker login ghcr.io -u <YOUR_GITHUB_USERNAME> --password-stdin
```

※ `<YOUR_TOKEN>`: GitHub에서 발급받은 Personal Access Token  
※ `<YOUR_GITHUB_USERNAME>`: GitHub 사용자 이름 (예: `smith-solution`)

---

## 🚀 3. 이미지 태그 및 푸시

```bash
docker tag vts-ipcamera-container ghcr.io/<YOUR_GITHUB_USERNAME>/vts-ipcamera-container:latest
docker push ghcr.io/<YOUR_GITHUB_USERNAME>/vts-ipcamera-container:latest
```

---

## 📥 4. 다른 환경에서 이미지 사용

```bash
docker pull ghcr.io/<YOUR_GITHUB_USERNAME>/vts-ipcamera-container:latest
docker run --rm -it ghcr.io/<YOUR_GITHUB_USERNAME>/vts-ipcamera-container:latest
```

---

## 🛠️ 참고: 설치 스크립트 실행 구조

`Dockerfile` 내에서 다음처럼 설치 스크립트를 실행합니다.

```dockerfile
COPY install_camera.sh /install_camera.sh
RUN chmod +x /install_camera.sh && /install_camera.sh
```

`install_camera.sh`에는 아래와 같은 내용이 포함됩니다:

```bash
#!/bin/bash

sudo apt update
sudo apt install -y libcamera-dev libcamera-apps
sudo apt install -y python3-picamera2
pip install simplejpeg --no-binary :all:
pip install picamera2
```

---

## 📚 추가 정보

- GitHub Container Registry: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry
- Docker 공식 문서: https://docs.docker.com/

