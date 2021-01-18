.PHONY: run test guard shell build lint

APP=ruby_xunit
RUN=@docker-compose run --rm ${APP}

run: build
	 ${RUN} ruby test/test_case_test.rb

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
