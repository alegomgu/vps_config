#!/bin/bash
set -e

echo "🔄 Actualizando sistema..."
sudo apt update && sudo apt upgrade -y

echo "🧰 Instalando entorno de escritorio XFCE + xrdp..."
sudo apt install -y xfce4 xfce4-goodies xrdp wget curl unzip git openjdk-17-jre python3 python3-pip python3-venv

echo "⚙️ Configurando xrdp..."
sudo adduser $USER ssl-cert
echo "startxfce4" > ~/.xsession
sudo systemctl enable xrdp
sudo systemctl restart xrdp

echo "📦 Instalando librerías de Python necesarias (global)..."
pip3 install --upgrade pip
pip3 install \
  'yfinance<=0.2.61' \
  pandas \
  numpy \
  plotly \
  matplotlib \
  scipy \
  lxml \
  fastapi \
  pydantic \
  ib_insync \
  requests

echo "📥 Descargando IB Gateway..."
cd ~
mkdir -p ibgateway && cd ibgateway
wget https://download2.interactivebrokers.com/installers/ibgateway/stable-standalone/ibgateway-stable-standalone-linux-x64.sh -O ibgateway_installer.sh
chmod +x ibgateway_installer.sh

echo "🧪 Instalando IB Gateway de forma no interactiva (modo consola)..."
yes | ./ibgateway_installer.sh

echo "✅ Instalación completada."
echo ""
echo "🖥️ Ya puedes conectarte por RDP a tu servidor con XFCE y usar IB Gateway."
