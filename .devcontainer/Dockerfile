# syntax=docker/dockerfile:1.5
#! Dockerfile syntax can be retrieved from https://hub.docker.com/r/docker/dockerfile
#* Use a variant of `mcr.microsoft.com/devcontainers/rust` which is compatible with the
#*   MAJOR version of Rust used by the Typst project!
ARG VARIANT

FROM mcr.microsoft.com/devcontainers/rust:${VARIANT}

# GitHub CLI
# RUN curl -sS https://webi.sh/gh | sh \
#     && source ~/.config/envman/PATH.env
RUN (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
# https://github.com/devcontainers-extra/features/blob/main/src/gh-cli/install.sh
# RUN $nanolayer_location \
#     install \
#     devcontainer-feature \
#     "ghcr.io/devcontainers-extra/features/gh-release:1.0.25" \
#     --option repo='cli/cli' --option binaryNames='gh' --option version="$VERSION"

# Install fontconfig and fonts
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends fontconfig fonts-roboto \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Source Sans Pro and Font Awesome
RUN mkdir -p ~/.fonts/source-sans \
    && gh release download --pattern '*TTF*.zip' -R adobe-fonts/source-sans \
    && unzip *TTF*source*sans*.zip -d ~/.fonts/source-sans \
    && gh release download --pattern 'fontawesome*free*desktop*.zip' -R FortAwesome/Font-Awesome \
    && unzip fontawesome*.zip -d ~/.fonts \
    && rm fontawesome*.zip *source*sans*.zip \
    && fc-cache -fv
