# docker-jenkins-slave

Docker Image packaging for Jenkins Slave, image based on Ubuntu 14.04, and Oracle Java 8.

When running ensure that the following environment variables are set:

 * MASTER_HOST: This is the IP/hostname of the master node.
 * SLAVE_NAME: The name, in your master node, of the slave you're setting up.
