FROM python:3.10-slim

# 安裝 Chromium 與其他依賴
RUN apt-get update && apt-get install -y \
    wget unzip curl gnupg2 \
    chromium chromium-driver \
    fonts-liberation \
    libglib2.0-0 \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# 設定環境變數
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER=/usr/bin/chromedriver

# 安裝 Python 套件
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製 bot 檔案
COPY . .

# 啟動 bot
CMD ["python", "阿瓦隆dc bot v1.2.2.py"]
