# docker_altus

This builds an easy to use docker image containing the latest `altus`
command line tool pulled from the upstream Python PIP repository.

The advantage of using this is simply that you don't need to install
anything (assuming docker is installed and working on your laptop).

# Use 
Use the `bin/altus` shell script as a drop in replacement for
the `altus` cli - this will ensure that `socks-proxy` works as you
expect even though you're "dockerized"

An example use is:
```
bin/altus dataeng list-clusters
```

This assumes that you've already setup your credentials in
$HOME/.altus, which is the default location. (Issue #8 records this
deficit). We mount $HOME/.altus into the container, so you can
configure your credentials as [per the cloudera
docs](https://www.cloudera.com/documentation/altus/topics/alt_client_setup.html),
which we've outlined below.

# ISSUES
+ #8 - we assume that altus credentials are in $HOME/.altus. No provision is made for using any other location

# Build the image:

use `bin/build.sh' to build the `tobyhferguson/docker_altus` image

```
bin/build.sh
```

# Run the image
Run the image thus:
```
bin/altus
```
This will mount the directory `~/.altus` into the image. This is necessary so that the Altus CLI credentials can be accessed.

## Configure your altus credentials

You will need to do a one-time setup of your `altus` credentials. We treat `$HOME/.altus` in the docker host as a pass through mount into the container so your credentials are properly stored across instances of a container running.

```
bin/altus configure
Altus Access Key ID [None]: XXX
Altus Private Key [None]: YYY
```

*Note*: this creates your altus configuration directory *outside of Docker* so
          you do not need to keep reconfiguring it. This uses a Docker volume to
          allow the docker environment to access this.

*Note*: If you're unable to enter the private key because it's too long, run
          through the basic configuration process to create the config file in
          $HOME/.altus/, and then edit it manually.


