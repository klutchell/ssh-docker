# docker-ssh

[ssh](https://www.ssh.com/ssh/) docker images

## Build

```bash
# build for x86_64
make

# build for armhf
make armhf
```

## Deploy

```bash
docker run --name ssh \
    -v ssh_data:/root/.ssh \
    -p 22:22 \
    klutchell/ssh
```

## Environment

|Name|Description|Example|
|---|---|---|
|`TZ`|container timezone|`America/Toronto`|

## Usage

add public keys to `/root/.ssh/authorized_keys`

```bash
# example - import keys from github
curl -sSL https://github.com/{your-github-username}.keys >> /root/.ssh/authorized_keys
```

## Author

Kyle Harding <kylemharding@gmail.com>

## License

[MIT License](./LICENSE)

## Acknowledgments

* https://github.com/resin-io-projects/resin-openssh

