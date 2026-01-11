# 1. 베이스 이미지 설정
FROM python:3.12-slim

# 2. 작업 디렉토리 생성
WORKDIR /app

# 3. 필수 패키지 및 의존성 설치
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. 소스 코드 복사
COPY . .

# 5. 보안을 위한 비루트(Non-root) 실행 설정
RUN chown -R 1000:1000 /app
USER 1000

# 6. 포트 노출 및 실행 명령어
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]