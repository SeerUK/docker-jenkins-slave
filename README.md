Docker Jenkins Slave
====================

Docker Image packaging for a Jenkins Slave. This image is built on top of [seeruk/java][1], and is
available on the [Docker Hub][2].

Usage
-----

The following environment variables are available to configure the slave.

* `JAVA_OPTS`: Used to customise the JVM running the slave. By default sets file encoding to UTF8.
* `MASTER_HOST`: This is the IP/hostname of the master node.
* `MASTER_PORT`: This is the port of the master node.
* `SLAVE_HOME`: The host directory of the slave user. (Doesn't update /etc/passwd, just sets $HOME).
* `SLAVE_NAME`: The name, in your master node, of the slave you're setting up.

The slave must have been created in the master node prior to running this container, otherwise the
slave will fail to start. When configuring these environment variables, consider whether or not
your Jenkins master is also in a Docker container; if it is linked, it may be better to use the
hostname and port of the linked container, instead of the exposed host and port.

Notes
-----

This image is currently built on OpenJDK 8. It was previously built on top of Oracle Java, but the
base image for that required the license for Oracle Java to be automatically accepted for you. This
is no longer necessary.

License
-------

MIT

Contributing
------------

Feel free to open a [pull request][3], or file an [issue][4] on Github. I always welcome
contributions as long as they're for the benefit of all (potential) users of this image.

If you're unsure about anything, feel free to ask about it in an issue before you get your heart
set on fixing it yourself.

[1]: https://hub.docker.com/r/seeruk/java/
[2]: https://hub.docker.com/r/seeruk/jenkins-slave
[3]: https://github.com/SeerUK/docker-jenkins-slave/pulls
[4]: https://github.com/SeerUK/docker-jenkins-slave/issues
