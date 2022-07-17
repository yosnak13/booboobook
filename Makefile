bundle-install:
	docker-compose run --rm app bundle install --without production

bundle-update:
	docker-compose run --rm app bundle update

db-migrate:
	docker-compose run --rm app bundle exec rails db:migrate RAILS_ENV=development

precompile:
	docker-compose run --rm app bundle exec rails assets:precompile RAILS_ENV=development

test:
	docker-compose run --rm app bundle exec rails test

build:
	docker-compose build

build-nc:
	docker-compose build --no-cache

down:
	docker-compose down

up:
	docker-compose up -d

stop:
	docker-compose stop

app bash:
	docker-compose exec app bash

db bash:
	docker-compose exec db bash