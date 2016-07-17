# Summary
A Docker image for AirSonos on Raspberry Pi (tested with 2 Model B).

AirSonos exposes Sonos as an AirPlay endpoint.  To learn more about AirSonos, [read the author's blog about it](https://medium.com/@stephencwan/hacking-airplay-into-sonos-93a41a1fcfbb).

# Acknowledgment
This image is heavily inspired by [justintime/airsonos](https://github.com/marcelst/docker-airsonos-pi).
Differences in this image are:
- fstehle/rpi-node:4 as base image in order to allow DockerHub building the image

# Intallation

1. Install Docker on you Raspberry Pi (e.g. http://blog.hypriot.com)
2. Run the container:
``` bash
sudo docker run --rm --net="host" --name="airsonos" \
  -p 5000-5050:5000-5050/tcp fstehle/rpi-airsonos
```

## Notes on running the container
Because the discovery mechanism uses mdns, you have to use ```--net="host"``` in order for discovery of your Sonos devices to work properly.  Since AirSonos binds to random ports between 5000 and 5050, it's best to publish them all.
