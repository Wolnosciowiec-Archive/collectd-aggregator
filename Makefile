SUDO=sudo
TAG=dev

build: ## Build (TAG)
	version=$$(make get_version)
	version=${version//[$'\t\r\n']}

	${SUDO} docker build . \
		-f Dockerfile \
		--build-arg BUILD_DATE=$$(date --iso-8601=seconds) \
		--build-arg VERSION=$${version} \
		--build-arg VCS_REF=$$(git rev-parse --verify HEAD) \
		-t quay.io/riotkit/collectd-aggregator:${TAG}

push: ## Publish (TAG)
	${SUDO} docker push quay.io/riotkit/collectd-aggregator:${TAG}

get_version:
	@git describe --abbrev=0 --tags 2>/dev/null || echo -n "0.0.1"

run: ## Run (TAG)
	${SUDO} docker run --rm --name collectd quay.io/riotkit/collectd-aggregator:${TAG}
