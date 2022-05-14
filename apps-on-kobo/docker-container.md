### Get a debian based docker image:
```
docker pull debian
```
If you have a nvidia card, install `nvidia-container-toolkit` on your host and:
```
docker pull nvidia/cudagl:11.3.0-devel-ubuntu20.04
```

### run the container
Normal:
```
docker run --privileged --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --net=host --env DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it --entrypoint /bin/bash debian
```
Nvidia:
```
docker run --privileged --gpus all,capabilities=utility --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --net=host --env DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -it --entrypoint /bin/bash nvidia/cudagl:11.3.0-devel-ubuntu20.04
```

### Get inside the container:
```
docker exec -it dockercontainerid bash
```

Execute this automated script:
```
curl -O https://raw.githubusercontent.com/Szybet/kobo-nia-audio/main/apps-on-kobo/script/kobo-qt-in-debian-container.sh; chmod +x kobo-qt-in-debian-container.sh; ./kobo-qt-in-debian-container.sh
```
For your own risk, obviously

It should install everything needed. now execute on your host:
```
xhost +local:docker
```
And you should be able to launch qt creator.

You propably want to save your container to a image:
```
docker commit dockercontainerid inkbox_dev:latest
```

A better example command I use to save changes for qt-creator, and in my projects:
```
docker run --privileged \
--gpus all,capabilities=utility \
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
--net=host \
--env DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--volume="$HOME/.config:/root/.config:rw" \
--volume="/mnt:/mnt:rw" \
-it --entrypoint /bin/bash nvidia/cudagl:11.3.0-devel-ubuntu20.04
```
