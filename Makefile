# Makefile – devstack/core
# Ortak Docker servislerini yönetmek için sade ve açıklamalı komut seti

COMPOSE=docker compose
ENV_FILE=.env

up:
	@$(COMPOSE) --env-file $(ENV_FILE) up -d

down:
	@$(COMPOSE) down

build:
	@$(COMPOSE) build

restart:
	@$(COMPOSE) down && $(COMPOSE) --env-file $(ENV_FILE) up -d

logs:
	@$(COMPOSE) logs -f

ps:
	@$(COMPOSE) ps

prune:
	@$(COMPOSE) down --remove-orphans
	@docker system prune -f

reset-volumes:
	@echo "⚠️  Tüm volume klasörleri silinecek..."
	@rm -rf volumes/*

# 🔧 Ekstra Komutlar

shell:
	@docker exec -it php84 sh

restart-nginx:
	@docker restart nginx

top:
	@docker stats

env:
	@echo "Aktif ortam değişkenleri:"
	@cat $(ENV_FILE)

volumes-tree:
	@echo "📁 Volume klasör yapısı:"
	@tree -d volumes || echo "tree komutu yüklü değilse: brew install tree"

# 📘 Yardım Komutu

help:
	@echo "🛠️  Kullanılabilir komutlar:"
	@echo "  make up               → Servisleri başlat"
	@echo "  make down            → Servisleri durdur"
	@echo "  make build           → Servisleri derle"
	@echo "  make restart         → Yeniden başlat"
	@echo "  make logs            → Logları izle"
	@echo "  make ps              → Container durumları"
	@echo "  make prune           → Docker temizliği"
	@echo "  make reset-volumes   → Tüm volume’leri sıfırla (dikkatli ol!)"
	@echo "  make shell           → PHP container'a gir (php84)"
	@echo "  make restart-nginx   → Sadece NGINX servisini yeniden başlat"
	@echo "  make top             → Canlı CPU/RAM kullanımını izle"
	@echo "  make env             → Aktif .env değişkenlerini göster"
	@echo "  make volumes-tree    → Volume klasör yapısını görsel olarak göster"