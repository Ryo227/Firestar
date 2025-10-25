# ベースイメージ（軽量なPythonベース）
FROM python:3.11-slim

# 環境変数設定
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 必要なOSパッケージのインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリ作成
WORKDIR /Firestar

# 依存関係のコピーとインストール
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# アプリケーションのコードをコピー
COPY . .

# ポートを公開（Webの場合は通常 8550）
EXPOSE 8550
