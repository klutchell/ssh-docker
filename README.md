# resin-ssh

[ssh](https://www.ssh.com/ssh/) docker images

## Build

```bash
# build for rpi3
make build-rpi3
```

## Deploy

```bash
# deploy on rpi3
docker run --name ssh \
-v ssh-data:/root/.ssh \
-p 22:22 \
-e TZ=America/Toronto \
klutchell/ssh:rpi3-latest
```

## Parameters

* `-v ssh-data:/root/.ssh` - persistent data volume
* `-p 22:22` - ports to expose
* `-e TZ=America/Toronto` - local timezone

## Usage

* add public keys to `/root/.ssh/authorized_keys`

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io-projects/resin-openssh

