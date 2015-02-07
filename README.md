# required

## setup iTerm2 for 256 colors
![rapid-view](https://github.com/waysaku/mac-playbook/blob/master/resources/iterm2256.png)

## install ansible
```
brew install ansible
```

## install XQuartz
```
visit http://xquartz.macosforge.org/landing/
and download dmg file.
```

# execution
```
$ cd [cloned repository directory]  
$ ansible-playbook setup-local.yaml -i hosts
```
