# git management 


multiple


```bash

#!/bin/bash

gituser_1=""
gituser_2=""

echo "CHOOSE git user"
echo "1 - USER 1"
echo "2 - USER 2"

read GITBOOL

if [ "$GITBOOL" == 1 ]
then
  GITUSER=$gituser_1
else
  GITUSER=$gituser_2
fi

echo $GITUSER

cp -rf ~/.gitconfig-${GITUSER} ~/.gitconfig
cp -rf ~/.ssh/config-${GITUSER} ~/.ssh/config

echo; echo;
echo "You are now ${GITUSER}:"
git config user.name && git config user.email



```


~/.ssh/config
```
~/.ssh/config
#Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_jaf


#config-user1
#Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_jaf

#config-user2
#Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa

```


~/.gitconfig 

```
~/.gitconfig 
[user]
        email = jeanandrewfuente@gmail.com
        name = Jean Andrew Fuentes

~/.gitconfig-jaf
[user]
        email = jeanandrewfuente@gmail.com
        name = Jean Andrew Fuentes

~/.gitconfig-user2
[user]
        email = user2@gmail.com
        name = user2fname user2lname
```
