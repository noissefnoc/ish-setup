# ish-setup
Setup procedure and scripts for iSH

## install packages
iSH has `apk` package manager, so install modules by `apk`

```console
# apk add make git zsh vim curl jq
```

## add non-root user
add non-root user for work

```console
# adduser -s /bin/zsh USERNAME
```

## switch user and set up

### switch user

```console
# su - USERNAME
```

### get from this repository file

```console
$ git clone https://github.com/noissefnoc/ish-setup.git
```

#### making zsh settings avairable

```console
$ make zsh-setup
```

#### setting up zsh
setting up `zsh` with zplugin


#### zsh/zprofile.zsh

```zsh
# set prompt
export PROMPT="%n@%~$ "
```
