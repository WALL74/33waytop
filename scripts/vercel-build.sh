#!/bin/bash

set -e  # 遇到错误立即退出

echo "🔧 Installing Go..."
curl -sSL https://golang.org/dl/go1.20.5.linux-amd64.tar.gz | tar -C /tmp -xzf -
export PATH="/tmp/go/bin:$PATH"

echo "📦 Setting up Hugo module cache..."
# 默认缓存路径：.vercel/cache (vercel 会保留这个目录内容)
export HUGO_MODULES_CACHE="/vercel/.cache/hugo_modules"
mkdir -p "$HUGO_MODULES_CACHE"
export HUGO_ENV="production"

echo "📥 Fetching Hugo modules..."
hugo mod tidy

echo "🚀 Building site..."
npm run build
