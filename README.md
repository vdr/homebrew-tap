# Vdr Tap

Variety of homebrew formulae.

## How do I install these formulae?

`brew install vdr/tap/<formula>`

Or `brew tap vdr/tap` and then `brew install <formula>`.

## Fido2 SSH Support

`brew install vdr/tap/vdr-fido2-ssh-support`

For Apple Silicon Macs, Sonoma (14+)

Although the default ssh-agent in macOS Sonoma supports FIDO2 somewhat, it needs a Security Provider
(like [Yubico libfido2](https://github.com/Yubico/libfido2))
Unfortunately [it is not working out of the box](https://github.com/Yubico/libfido2/issues/464) and require "too" clever rebuild.

Instead, enable the vanilla OpenSSH agent, with necessary tooling to make it work.

## ssh-askpass

`brew install vdr/tap/ssh-askpass`

Simple copy of [ssh-askpass](https://github.com/theseal/ssh-askpass),
but without caveat about the service and some Apple Silicon fixes.
(equivalent of the service will be done in `openssh-fido-agent-install`)

