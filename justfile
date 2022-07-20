set export
set positional-arguments

buildx-version := "0.8.2"
name := "selfoss"
plugins-dir := "~/.docker/cli-plugins"

user := env_var_or_default('DOCKERHUB_USERNAME', 'none')
password := env_var_or_default('DOCKERHUB_PASSWORD', 'none')
registry := "docker.io"
repository := env_var_or_default('DOCKERHUB_REPOSITORY', 'none')

BUILD_DATE := `date -u +'%Y-%m-%dT%H:%M:%SZ'`
VCS_REF := `git describe --tags --always --dirty`



defaults:
    @just --list

build version platform: _deps _qemu
    docker buildx create --use --driver docker-container --name builder
    docker buildx build --build-arg version={{version}} --platform {{platform}} --tag {{name}} --cache-to "type=local,dest=.cache/{{platform}}/{{version}}" --load .
    docker buildx rm builder

_login user password registry:
    echo "{{password}}" | docker login -u "{{user}}" --password-stdin {{registry}}

_deps:
    #!/usr/bin/env sh
    if [ ! -f {{plugins-dir}}/docker-buildx ]; then
        mkdir -p {{plugins-dir}}
        wget https://github.com/docker/buildx/releases/download/v{{buildx-version}}/buildx-v{{buildx-version}}.linux-amd64 -O {{plugins-dir}}/docker-buildx
        chmod a+x {{plugins-dir}}/docker-buildx
    fi

_qemu:
    docker run --privileged multiarch/qemu-user-static --reset -p yes

run:
    docker run --rm -d --name {{name}} {{name}}

scan image:
    trivy image --ignore-unfixed --severity MEDIUM,HIGH,CRITICAL \
    --exit-code 1 --no-progress --security-checks vuln \
    {{image}}

test: (build "latest" "linux/amd64") run
    docker stop {{name}}

_update_readme:
    docker run -v ${PWD}:/workspace -e DOCKERHUB_USERNAME -e DOCKERHUB_PASSWORD -e DOCKERHUB_REPOSITORY -e README_FILEPATH=/workspace/README.md peterevans/dockerhub-description


upload version platform: (_login {{user}} {{password}} {{registry}})
    #!/usr/bin/env sh
    docker buildx build . --push --platform {{platform}} \
        --cache-from "type=local,src=.cache/linux/{{platform}}/{{version}}" \
        --label "org.opencontainers.image.created=${BUILD_DATE}" \
        --label "org.opencontainers.image.revision=${VCS_REF}" \
        --tag {{repository}}:{{version}}
    if [ "{{registry}}" == "docker.io"]; then
        _update_readme
    fi
