# resin-ssh

[ssh](https://www.ssh.com/ssh/) service for [resin.io](https://resin.io/) stacks

## Getting Started

* https://docs.resin.io/learn/getting-started
* https://www.ssh.com/ssh/#sec-Running-amp-configuring-SSH

## Deployment

```bash
docker run --name ssh \
-v ssh-data:/root/.ssh \
-p 22:22 \
-e TZ=America/Toronto \
klutchell/resin-ssh
```

## Usage

1. use the `ssh` [resin web terminal](https://docs.resin.io/learn/manage/ssh-access/#using-the-dashboard-web-terminal)
to add public keys to `/root/.ssh/authorized_keys`
2. connect to `root@<device-ip>:22` for secure shell access

## Author

Kyle Harding <kylemharding@gmail.com>

## License

_tbd_

## Acknowledgments

* https://github.com/resin-io-projects/resin-openssh

