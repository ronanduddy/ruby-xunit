.PHONY: run test guard shell build lint

APP=ruby_xunit
RUN=@docker-compose run --rm ${APP}

run: build
	 # ${RUN} TBC

test: build
	${RUN} bundle exec rspec

guard: build
	${RUN} bundle exec guard

shell: build
	${RUN} sh

build:
	@docker-compose build ${APP}

lint:
	${RUN} rubocop -a
