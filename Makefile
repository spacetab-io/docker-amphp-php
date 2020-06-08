VERSION = 1.1.0
PUSH = false

alpine-base74: NAME = spacetabio/amphp-alpine:7.4-base
alpine-base74:
	docker build -f "base/7.4/alpine.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

alpine-test-xdebug74: NAME = spacetabio/amphp-alpine:7.4-test-xdebug
alpine-test-xdebug74:
	docker build -f "test-xdebug/7.4/alpine.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

alpine-base-xdebug74: NAME = spacetabio/amphp-alpine:7.4-base-xdebug
alpine-base-xdebug74:
	docker build -f "base-xdebug/7.4/alpine.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

alpine-wkhtmltopdf74: NAME = spacetabio/amphp-alpine:7.4-wkhtmltopdf
alpine-wkhtmltopdf74:
	docker build -f "wkhtmltopdf/7.4/alpine.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

alpine-wkhtmltopdf-xdebug74: NAME = spacetabio/amphp-alpine:7.4-wkhtmltopdf-xdebug
alpine-wkhtmltopdf-xdebug74:
	docker build -f "wkhtmltopdf-xdebug/7.4/alpine.dockerfile" -t $(NAME)-$(VERSION) .
	@if [ "${PUSH}" == 'true' ]; then \
	    docker push $(NAME)-$(VERSION) ; \
	fi

base74: alpine-base74 alpine-base-xdebug74
wk74: alpine-wkhtmltopdf74 alpine-wkhtmltopdf-xdebug74
all74: alpine-base74 alpine-xdebug74 alpine-wkhtmltopdf74 alpine-wkhtmltopdf-xdebug74
