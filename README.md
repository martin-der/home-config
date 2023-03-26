
# Configuration files ( dot files )

## Installation

```shell
cd ~
git init
git remote add github git@github.com:martin-der/home-config.git
git pull github master
```

## Convenient Setup

Allow to push and pull from remote without specifying the remote branch
```shell
git config push.default current
git branch master --set-upstream-to=github/master
```


------------

Set remote as SSH URL in order to be able to use Key
```shell
git remote set-url github github.com:martin-der/home-config.git
```
Same thing for competitors
```
git remote add bitbucket git@bitbucket.org:martin-der/home-config.git
git remote add gitlab git@gitlab.com:martin-der/home-config.git
```

-----------

## Let's turn this into a small howto....

Access github using ssh on 443 while using a http proxy ( requires the _connect-proxy_ command )
```ssh/config
Host github.com
  Hostname ssh.github.com
  Port 443
  ProxyCommand connect-proxy -H localhost:3128 %h %p
```

Same workaround for a competitor( still requires the _connect-proxy_ command )
```ssh/config
Host bitbucket.org
  Hostname altssh.bitbucket.org
  Port 443
  ProxyCommand connect-proxy -H localhost:3128 %h %p
```

-----------

## See also
... for more information

* [MDU Shell README](.config/mdu/README.md)

