nuagebec-ubuntu
============
[![Docker Stars](https://img.shields.io/docker/stars/_/ubuntu.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/mashape/kong.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)]()

Simple always updated Ubuntu docker images with SSH access and supervisord.

It include some tools like :

- python 2.7 & 3
- ruby 1.9
- wget
- vim-nox
- git
- tar
- ca-certificates

Usage
-----

To create the image `nuagebec/ubuntu` with Ubuntu,
execute the following commands on the nugebec-ubuntu master branch:

	git checkout master
	docker build -t nuagebec/ubuntu .

Running nuagebec/ubuntu
--------------------

To run a container from the image you created earlier binding it to port 2222 in
all interfaces, execute:

	docker run -d -p 0.0.0.0:2222:22 nuagebec/ubuntu

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	You can now connect to this Ubuntu container via SSH using:

	    ssh -p <port> root@<host>
	and enter the root password 'U0iSGVUCr7W3' when prompted

	Please remember to change the above password as soon as possible!
	========================================================================

In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!


Setting a specific password for the root account
------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

	docker run -d -p 0.0.0.0:2222:22 -e ROOT_PASS="mypass" nuagebec/ubuntu

Deactivating ssh server
-----------------------

you may not like to have a running ssh server use SSH_SERVER=false to prevent starting it. Default is true


        docker run -e SSH_SERVER=false nuagebec/ubuntu

