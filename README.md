# rsprta/selfoss [![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/rsprta/selfoss)](https://hub.docker.com/r/rsprta/selfoss) [![Docker Pulls](https://img.shields.io/docker/pulls/rsprta/selfoss)](https://hub.docker.com/r/rsprta/selfoss) [![Pipeline status](https://gitlab.com/radek-sprta/docker-selfoss/badges/master/pipeline.svg)](https://gitlab.com/radek-sprta/docker-selfoss/commits/master)

![selfoss](https://i.imgur.com/8hJyBgk.png "selfoss")

## Quick reference
- **Maintained by**: [Radek Sprta](https://gitlab.com/radek-sprta)
- **Where to get help**: [Repository Issues](https://gitlab.com/radek-sprta/docker-selfoss/-/issues)

## Description

A multipurpose RSS reader, live stream, mashup, aggregation web application.

### Features

- Lightweight & secure image (no root process)
- Based on Alpine Linux
- Latest Selfoss version (2.18)
- SQLite (default), MySQL and PostgreSQL driver
- With Nginx and PHP7

### Build-time variables

- **VERSION** = selfoss version
- **SHA256_HASH** = SHA256 hash of selfoss archive

### Runtime variables

- **SELFOSS_CONFIG_FILE** = Custom config.ini location

### Ports

- 8888

### Environment variables

| Variable | Description | Type | Default value |
| -------- | ----------- | ---- | ------------- |
| **UID** | selfoss user id | *optional* | 991
| **GID** | selfoss group id | *optional* | 991
| **CRON_PERIOD** | Cronjob period for updating feeds | *optional* | 15m
| **UPLOAD_MAX_SIZE** | Attachment size limit | *optional* | 25M
| **LOG_TO_STDOUT** | Enable nginx and php error logs to stdout | *optional* | false
| **MEMORY_LIMIT** | PHP memory limit | *optional* | 128M

## Usage
The simplest way to run the container is the following command:

```bash
docker run --detach --volume /mnt/docker/selfoss:/selfoss/data rsprta/selfoss
```

Or using `docker-compose.yml`:

```yaml
version: '3'
services:
  selfoss:
    container_name: selfoss
    image: rsprta/selfoss
    restart: unless-stopped
    volumes:
      - /mnt/docker/selfoss:/selfoss/data
```

## Contact
- [mail@radeksprta.eu](mailto:mail@radeksprta.eu)- [incoming+radek-sprta/docker-selfoss@gitlab.com](incoming+radek-sprta/docker-selfoss@gitlab.com)

## Credits
The image is forked from [hardware/selfoss](https://github.com/hardware/selfoss).

This package was created with [Cookiecutter][cookiecutter] from [cookiecutter-docker-multiarch](https://gitlab.com/radek-sprta/cookiecutter-docker-multiarch).

[cookiecutter]: https://github.com/audreyr/cookiecutter
