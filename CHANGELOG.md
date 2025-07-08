# Changelog – dev-stack/core

Tüm değişiklikler bu dosyada versiyonlanacaktır.

Format: [YIL-AY-GÜN] Version – Açıklama

---

## [2025-07-08] v1.0.0 – İlk stabil sürüm

### ✨ Eklendi
- `docker-compose.yml` oluşturuldu
- Ortak servisler yapılandırıldı:
  - nginx
  - redis
  - mailhog
  - minio
  - postgres
  - pgadmin
  - mysql
  - phpmyadmin
  - php84
- Ortam değişkenleri `.env` dosyası ile yönetilir
- NGINX yönlendirmeleri `conf.d/*.test.conf` şeklinde yapılandırıldı
- `core/volumes/` altında servis bazlı kalıcı veri dizinleri oluşturuldu

### 🛠️ Araçlar
- `Makefile` eklendi: servis kontrol komutları (`make up`, `make logs`, `make reset-volumes`, vb.)

---

## [2025-07-08] v1.0.1 – TTOC nginx yapılandırması eklendi, küçük ayarlar güncellendi

### ✨ Eklendi
- `services/nginx/conf.d/ttoc.test.conf` aktif edildi
- Ortak yapılandırmalar için `_global.conf` dosyası eklendi

### 🛠️ Güncellendi
- `pgadmin.test.conf`: `client_max_body_size` parametresi eklendi
- `.env-example`: geçersiz email adresi düzeltildi
- `docker-compose.yml`: yapı sadeleştirmesi yapıldı

---

## Gelecek
- Ortak servisler için ek config desteği (örneğin custom redis.conf, postgres init)
- Servis sağlık kontrolleri (`healthcheck:` tanımları)
- Log yönetimi: centralized log sistemi (opsiyonel)