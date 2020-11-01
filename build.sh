#!/usr/bin/env sh

platforms() {
    plat="$(grep '^[^#].*' < arch.txt)"
    arch_count="$(echo "$plat" | wc -l)"
    echo "$plat" | tr '\n' ',' | cut -d, -f1-$arch_count
}

create() {
    docker buildx create --use
}

build() {
    tagname="$1"
    docker pull 'alpine:latest'
    docker buildx build --push --tag="$tagname" --platform="$(platforms)" .
}

get_tag() {
    git rev-parse --short HEAD
}

deploy() {
    tag0="redxef/certbot-duckdns:$(get_tag)"
    tag1="redxef/certbot-duckdns:latest"
    build "$tag0"
    build "$tag1"
}

"$@"
