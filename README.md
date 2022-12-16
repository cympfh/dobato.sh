# Dobato.sh - 堂鳩.sh

Re-implemented https://github.com/himkt/dobato as shellscripts

## Install

TBW

## Setup

Run `dobato.sh config`

```shell
> dobato.sh config
Discord webhook url: https://example.com/webhook
Slack webhook url: https://example.com/webhook
```

If you don't need Discord (or Slack), please press Enter without typing anything.

## Usage

```shell
> dobato.sh notify "Hello, World"
```

If both (discord and slack) are available, `dobato.sh` will try to use Discord.
If only one is available, it will be used.
