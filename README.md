# NTP Enabled Container

![Contimer Logo](./contimer_logo.jpg)
Photo by [team voyas](https://unsplash.com/@voyas?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText "team voyas") on [Unsplash](https://unsplash.com/s/photos/time?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)
  

## This is a Chrony implementation in docker container, that you can use for all your NTP needs

The base distro used for this is Alpine Linux. When I started this I wanted to go for ntpd, but it seems
that ntpd is not so much supported anymore by the distros, and Chrony has better performance overall.
So there it is, NTP with chrony. 

The provided configuration file comes with two ntp pools configured, which is more than enough, but if you
feel the need, you can check the *ntp_servers.md* file, for more public ntp servers

## Contents

- Configuration file *chrony.conf*
- Keyfile with a couple of secrets *chrony.keys*
- NTP servers list *ntp_servers.md*
- Some useful chronyc commands *useful_commands*
- This *README.md* file

## Using the container

You can build your own container from this:

*docker image build -t contimer .*

After you have the container image, you can run it by publishing udp/123 port like this:

*docker container run -d --rm --network bridge --name ntp -p 123:123/udp contimer*

I have exposed port 123/udp and port 323/udp in the Dockerfile, but that might not help you so much
because if you are using -P, docker will chose random high ports on the local host

*docker container run -d --rm --network bridge --name ntp2 -P contimer*
