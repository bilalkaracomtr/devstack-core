# dev-stack / core

Yerel geliştirme ortamları için hazırlanmış ortak Docker servisleri.

Bu klasör, `apps/` altındaki tüm projeler tarafından paylaşılabilecek, önceden yapılandırılmış servisleri içerir.  
Her servis, kendi `.test` alan adı üzerinden NGINX reverse proxy ile yönlendirilir.

---

## 🚀 İçerdiği Servisler

| Servis       | Açıklama                         | URL (hosts tanımı gerekir)         |
|--------------|----------------------------------|------------------------------------|
| `nginx`      | Reverse proxy yönetimi           | —                                  |
| `redis`      | Cache ve queue                   | —                                  |
| `mailhog`    | SMTP test ortamı                 | http://mailhog.test                |
| `minio`      | S3 uyumlu object storage         | http://minio.test                  |
| `postgres`   | PostgreSQL veritabanı            | —                                  |
| `pgadmin`    | PostgreSQL yönetim arayüzü       | http://pgadmin.test                |
| `mysql`      | MySQL 8 veritabanı               | —                                  |
| `phpmyadmin` | MySQL yönetim arayüzü            | http://phpmyadmin.test             |
| `php84`      | PHP 8.4 FPM container            | —                                  |

> Not: Tüm `*.test` domainlerini sisteminizde `/etc/hosts` dosyası üzerinden `127.0.0.1` olarak tanımlamalısınız.

---

## ⚙️ Kullanım

```bash
# Servisleri başlat
make up

# Servisleri durdur
make down

# Servisleri build et
make build

# Servisleri yeniden başlat
make build

# Logları izle
make logs

# Container durumlarını gör
make ps

# Tüm gereksiz docker objelerini temizle
make prune

# Tüm volume verilerini sil (dikkatli!)
make reset-volumes

# Belirli servisin içine gir (örnek: php84)
make shell

# Sadece nginx servisini yeniden başlat
make restart-nginx

# Docker servis kaynaklarını canlı izle
make top

# Ortam değişkenlerini görüntüle
make env

# Volume klasör yapısını gör
make volumes-tree
```

---

## 📁 Klasör Yapısı

```bash
core
├── .env
├── .env-example
├── .gitignore
├── CHANGELOG.md
├── docker-compose.yml
├── LICENSE
├── Makefile
├── README.md
├── services
│   ├── nginx
│   │   └── conf.d
│   │       ├── bagisto.test.conf
│   │       ├── django.test.conf.disabled
│   │       ├── laravel.test.conf
│   │       ├── mailhog.test.conf
│   │       ├── minio.test.conf
│   │       ├── pgadmin.test.conf
│   │       ├── phpmyadmin.test.conf
│   │       ├── prestashop.test.conf.disabled
│   │       ├── symfony.test.conf
│   │       ├── tasktrack-api.test.conf.disabled
│   │       ├── tasktrack-web.test.conf.disabled
│   │       ├── ttoc.test.conf.disabled
│   │       ├── ttpanel-api.test.conf.disabled
│   │       └── ttpanel-web.test.conf.disabled
│   └── php
│       └── php84
│           ├── Dockerfile
│           └── php.ini
└── volumes
    ├── minio
    │   ├── config
    │   └── data
    ├── mysql
    ├── nginx
    │   └── logs
    ├── pgadmin
    ├── postgres
    └── redis
```

## 📄 Ortam Değişkenleri

Tüm servis ayarları `.env` dosyası ile yönetilir.  
Başlangıç için örnek `.env.example` dosyasını kopyalayabilirsiniz:

> Not: `.env.example` dosyası içindeki değişkenleri ihtiyaca göre güncelleyebilirsiniz.

---

## 🧠 Notlar

- Tüm servisler `core_net` ağı üzerinde çalışır
- Her servis `Makefile` komutlarıyla yönetilir
- Servislerin `*.test.conf` NGINX yönlendirmeleri `services/nginx/conf.d/` içinde yer alır

---

## 🪪 Lisans

Bu proje [MIT Lisansı](./LICENSE) ile lisanslanmıştır.