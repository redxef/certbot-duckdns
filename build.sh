#!/usr/bin/env sh

platforms() {
    local plat="$(grep '^[^#].*' < arch.txt)"
    local arch_count="$(echo "$plat" | wc -l)"
    echo "$plat" | tr '\n' ',' | cut -d, -f1-$arch_count
}

create() {
    docker buildx create --use
}

build() {
    local tagname="$1"
    docker pull 'alpine:latest'
    docker buildx build --push --tag="$tagname" --platform="$(platforms)" .
}

"$@"
