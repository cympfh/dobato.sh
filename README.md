# Dobato.sh - 堂鳩.sh

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
Discord webhook url: https://example.com/webhook
Slack webhook url: https://example.com/webhook
```

If you don't need Discord (or Slack), please press Enter without typing anything.

By default, `config` makes `~/.dobato` as a global config.
Use flag `--local` to make a local config file.

## Usage

```shell
> dobato.sh notify "Hello, World"
```

If both (discord and slack) are available, `dobato.sh` will try to use Discord.
If only one is available, it will be used.
