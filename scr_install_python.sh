#!/bin/bash

set -e

echo "Обновление списка пакетов..."
sudo apt update

sudo apt install -y software-properties-common

echo "Добавление PPA deadsnakes (для получения актуальных версий Python)..."
sudo add-apt-repository -y ppa:deadsnakes/ppa

echo "Обновление списка пакетов после добавления репозитория..."
sudo apt update

Python_version="3.12"

echo "Установка Python версии ${Python_version} ..."
sudo apt install -y python${Python_version} python${Python_version}-venv python${Python_version}-dev

VENV_PATH="$HOME/python-${Python_version}-testenv"
echo "Создание тестового виртуального окружения..."
python${Python_version} -m venv ${VENV_PATH}

echo "Активация окружения и установка пакетов..."
source "$VENV_PATH/bin/activate"
pip install --upgrade pip
pip install requests flask

echo "Успешно! Тестовое окружение: ${VENV_PATH}"
echo "Для активации: source ${VENV_PATH}/bin/activate"

deactivate

echo "Python ${Python_version} установлен!"
python${Python_version} --version



