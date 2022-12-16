# Dobato.sh - 堂鳩.sh

Notification for your Discord.

Re-implemented https://github.com/himkt/dobato as shellscripts

## Install

Download a script file:
https://github.com/cympfh/dobato.sh/blob/main/bin/dobato.sh

For example,

```shell
> mkdir -p ~/.local/bin
> wget https://github.com/cympfh/dobato.sh/blob/main/bin/dobato.sh > ~/.local/bin/dobato.sh
> chmod +x ~/.local/bin/dobato.sh
> export PATH=~/.local/bin/:$PATH
```

## Setup

Run `dobato.sh config`

```shell
> dobato.sh config
Discord webhook url: https://discord.com/api/webhooks/123/ABCabc
```

By default, `config` makes `~/.dobato` as a global config.
Use flag `--local` to make a local config file.

## Usage

Notify by text or file.
The filename must be `*.txt`.

```shell
> dobato.sh notify "Hello, World"
> dobato.sh notify longmessage.txt
```

## References

- [Intro to Webhooks - Discord](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks)

