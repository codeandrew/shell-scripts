# Docker Configs


## Run without sudo


```bash
sudo groupadd docker 
sudo usermod -aG docker ${USER}

# Need to login again to see changes
su - ${USER}

# once you relogin 
╰─$ id
uid=1000(jaf) gid=1000(jaf) groups=1000(jaf),27(sudo),117(admin),999(docker)


╰─$ docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly

```
