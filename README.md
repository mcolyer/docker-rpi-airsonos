# Summary
This is a Docker container for AirSonos on Raspberry Pi (tested with 2 Model B).

AirSonos exposes Sonos as an AirPlay endpoint.  To learn more about AirSonos, [read the author's blog about it](https://medium.com/@stephencwan/hacking-airplay-into-sonos-93a41a1fcfbb).

# Acknowledgment
This image is heavily inspired by [justintime/airsonos](https://github.com/justintime/docker-airsonos).
Differences in this image are: 
- hypriot/rpi-node:0.10.36 image as base
- supervisord instead of phusion/baseimage.

#  Running the airsonos container
``` bash
sudo docker run -d --restart=always --net="host" --name="airsonos" \
  -p 5000-5050:5000-5050/tcp justintime/airsonos
```

## Notes on running the container
Because the discovery mechanism uses mdns, you have to use ```--net="host"``` in order for discovery of your Sonos devices to work properly.  Since AirSonos binds to random ports between 5000 and 5050, it's best to publish them all.

