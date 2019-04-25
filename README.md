# docker_altus

This builds an easy to use docker image containing the latest `altus` command line tool pulled from the upstream Python PIP repository.


# Build the image:

use `bin/build.sh' to build the `docker_altus` image

```
bin/build.sh
```

# Run the image
Run the image thus:
```
bin/run_docker_altus
```
This will mount the directory `~/.altus` into the image. This is necessary so that the Altus CLI credentials can be accessed.

If you haven't set up the Altus CLI credentials then do so using these instructions:
## Configure your altus credentials

You will need to do a one-time setup of your `altus` credentials. We treat `$HOME/.altus` in the docker host as a pass through mount into the container so your credentials are properly stored across instances of a container running.

```
bin/run_docker_altus configure
Altus Access Key ID [None]: XXX
Altus Private Key [None]: YYY
```

*Note*: this creates your altus configuration directory *outside of Docker* so
          you do not need to keep reconfiguring it. This uses a Docker volume to
          allow the docker environment to access this.

*Note*: If you're unable to enter the private key because it's too long, run
          through the basic configuration process to create the config file in
          $HOME/.altus/, and then edit it manually.


# Testing Notes:

This was tested on Docker for Mac using build 17.05.0-ce-rc1-mac8 (16582). If you run into problems, check that you're running _atleast_ that version.
