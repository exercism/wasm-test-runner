FROM node:16-bullseye-slim as runner
# Node.js 16 (curently LTS)
# Debian bullseye

# fetch latest security updates
RUN set -ex
apt-get update
apt-get upgrade -y
# curl is required to fetch our webhook from github
# unzip is required for unzipping payloads in development
apt-get install curl unzip jq -y
rm -rf /var/lib/apt/lists/*

# add a non-root user to run our code as
RUN adduser --disabled-password --gecos "" appuser

# install our test runner to /opt
WORKDIR /opt/test-runner
COPY . .

# Build the test runner
RUN set -ex
pnpm install
pnpm build
# install all the development modules (used for building)
rm -rf node_modules
# install only the node_modules we need for production
pnpm install --production

USER appuser
ENTRYPOINT [ "/opt/test-runner/bin/run.sh" ]
