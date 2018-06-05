# resin-ssh

[ssh](https://www.ssh.com/ssh/) service for [resin.io](https://resin.io/) stacks

## Build

```bash
make build
docker login
make push
```

## Deploy

```bash
docker run --name ssh \
-v ssh-data:/root/.ssh \
-p 22:22 \
-e TZ=America/Toronto \
klutchell/resin-ssh
```

## Usage

use the [resin web terminal](https://docs.resin.io/learn/manage/ssh-access/#using-the-dashboard-web-terminal)
to add public keys to `/root/.ssh/authorized_keys`

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io-projects/resin-openssh

