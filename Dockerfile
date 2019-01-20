FROM alpine:latest
MAINTAINER Saul <saulmm2@gmail.com>

LABEL "com.github.actions.name"="Branch Cleanup"
LABEL "com.github.actions.description"="Delete the branch after a pull request has been merged"
LABEL "com.github.actions.icon"="activity"
LABEL "com.github.actions.color"="red"

ENV SDKMAN_DIR=/root/.sdkman

RUN apk upgrade --update && \
    apk add --no-cache --update libstdc++ curl ca-certificates bash zip unzip openssl && \
    update-ca-certificates && \
    curl -s "https://get.sdkman.io" | bash && \
    rm -rf /var/lib/apt/lists/* && \
    echo "sdkman_auto_answer=true" > $SDKMAN_DIR/etc/config && \
    echo "sdkman_auto_selfupdate=false" >> $SDKMAN_DIR/etc/config && \
    echo "sdkman_insecure_ssl=true" >> $SDKMAN_DIR/etc/config

RUN apk update
RUN apk add openjdk8-jre
RUN apk add maven

RUN	apk add --no-cache \
	bash \
	ca-certificates \
	curl \
	jq

SHELL [ "/bin/bash", "-c" ]
RUN source /root/.sdkman/bin/sdkman-init.sh && sdk install kotlin
RUN source /root/.sdkman/bin/sdkman-init.sh && sdk install kscript
COPY stuff.kts /root/
RUN source /root/.sdkman/bin/sdkman-init.sh && kscript /root/stuff.kts

ENTRYPOINT sh

COPY test_action /usr/bin/test_action

ENTRYPOINT ["test_action"]