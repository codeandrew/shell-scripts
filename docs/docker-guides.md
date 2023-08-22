# Docker

## TIPS and Tricks

**RUN vs CMD vs ENTRYPOINT**
- **RUN** : executes command in a new layer, creating a new image. commonly used for installing software packages
- **CMD** : sets default command or paramaters that can be overridden when launching a docker container
- **ENTRYPOINT** : configures a container to run as an executable

