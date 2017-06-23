# docker-altuscli

This builds an easy to use docker image containing the latest `altus` command line tool pulled from the upstream Python PIP repository.


# Build the image:

If you need to rebuild the docker image after modifying the Dockerfile, this is how you do it. It will create a container called `altus`

```
docker build -t altus .
```

# Configure your altus credentials

You will need to do a one-time setup of your `altus` credentials. We treat `$HOME/.altus` in the docker host as a pass through mount into the container so your credentials are properly stored across instances of a container running.

```
docker run -t -i -v ~/.altus:/root/.altus altus altus configure
Altus Access Key ID [None]: XXX
Altus Private Key [None]: YYY
```

*Note*: this creates your altus configuration directory *outside of Docker* so
          you do not need to keep reconfiguring it. This uses a Docker volume to
          allow the docker environment to access this.

*Note*: If you're unable to enter the private key because it's too long, run
          through the basic configuration process to create the config file in
          $HOME/.altus/, and then edit it manually.


# Run the image:

You can choose to launch a shell into the container and run altus commands from there.

```
docker run -t -i -v ~/.altus:/root/.altus altus /bin/bash
```

You can choose to do one-off commands

```
docker run -t -i -v ~/.altus:/root/.altus altus altus help
```

# Run the dataeng socks-proxy

Sometimes you may need to access the Cloudera Manager instance on the cluster. In order
to do this, you must launch the `altus dataeng socks-proxy` command. But, because we're
running `altus` from within a container, you must expose a few ports to the docker host
and allow SSH to reconfigure and permit "remote" hosts to connect to the SOCKS port.

In our case, "remote" is just the docker host. We do not setup port access such that a
host completely separate from the docker host can access the proxy.

*Note*: You will need to stash a copy of your ssh key some place that is accessible from
_within_ the container. The easiest place is to copy it into your `$HOME/.altus` directory,
which we expose as a mount point into the container.

```
docker run -t -i -p 1080:1080 -v ~/.altus:/root/.altus altus \
   altus dataeng socks-proxy \
   --cluster-name "tcampbell_hive_wa_2" \
   --ssh-private-key="/root/.altus/tcampbellprimary.pem"
```

# Testing Notes:

This was tested on Docker for Mac using build 17.05.0-ce-rc1-mac8 (16582). If you run into problems, check that you're running _atleast_ that version.
