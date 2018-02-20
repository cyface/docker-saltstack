# docker-saltstack
Docker Compose setup to spin up a salt master and minion.

The salt-master is set up to accept all minions that try to connect, which is not a good prod configuration, but makes this setup quick and easy for test and dev purposes.  No ports are externally exposed.

Just run 
`docker-compose up`
from a checkout of this directory on a system setup to run docker compose, and the master and minion will start up.

Then you can (in a separate shell window):

`docker-compose exec salt-master bash`

and it will log you into the command line of the salt-master server.

From that command line you can run something like:

`salt '*' test.ping`

and in the window where you started docker compose, you will see the log output of both the master sending the command and the minion receiving the command and replying.

[The Salt Remote Execution Tutorial](https://docs.saltstack.com/en/latest/topics/tutorials/modules.html) has some quick examples of the comamnds you can run from the master.
