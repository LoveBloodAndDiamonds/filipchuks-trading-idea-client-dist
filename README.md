
# Деплой проекта на Ubuntu 22.04

Эта инструкция поможет вам развернуть проект на вашем сервере или локальной машине под управлением Ubuntu 22.04.

## Шаги деплоя

### 1. Обновите систему

Перед установкой необходимых пакетов обновите вашу систему до последней версии:

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Установите Docker и Docker Compose

#### Установка Docker

Запустите следующую команду для загрузки установочного скрипта Docker:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
```

Запустите скрипт установки Docker:

```bash
sudo sh get-docker.sh
```

После завершения установки добавьте текущего пользователя в группу `docker`, чтобы запускать команды Docker без `sudo`:

```bash
sudo usermod -aG docker $USER
```

Перезагрузите терминал или выполните:

```bash
newgrp docker
```

#### Установка Docker Compose

Загрузите последнюю версию Docker Compose:

```bash
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Измените разрешения для Docker Compose:

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

Проверьте, что Docker и Docker Compose установлены:

```bash
docker --version
docker-compose --version
```

### 3. Клонируйте репозиторий проекта

Клонируйте репозиторий:

```bash
git clone https://github.com/LoveBloodAndDiamonds/filipchuks-trading-idea-client-dist.git
```

Перейдите в директорию проекта:

```bash
cd filipchuks-trading-idea-client-dist
```

### 4. Настройте файл `.env`

Скопируйте шаблон файла `.env.dist` в `.env`:

```bash
cp .env.dist .env
```

Отредактируйте параметры файла `.env` под вашу конфигурацию (например, базы данных, порты и т.д.) с помощью текстового редактора:

```bash
nano .env
```

Сохраните изменения после редактирования.

### 5. Запустите проект

Теперь, когда файл `.env` настроен, запустите контейнеры через Docker Compose:

```bash
docker-compose up -d
```

Опция `-d` запускает контейнеры в фоновом режиме.

### 6. Проверьте логи контейнеров

Для проверки корректности работы контейнеров просмотрите их логи:

```bash
docker-compose logs -f
```

### 7. Доступ к административной панели

Откройте браузер и перейдите по следующему адресу:

```
http://{ip}:{port}/admin
```

Где:
- `{ip}` — это IP-адрес вашего сервера или `localhost`, если вы работаете локально.
- `{port}` — порт, указанный в вашем `.env` файле.

Пример: `http://123.45.67.89:8080/admin`

---

Если приложение запускается не на стандартном порту, сообщите об этом вашему системному администратору.
