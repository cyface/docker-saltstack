# docker-saltstack
Docker Compose setup to spin up a salt master and minion.

The salt-master is set up to accept all minions that try to connect, which is not a good prod configuration.

Just run 
`docker compose up`
from a checkout of this directory on a system setup to run docker compose, and the master and minion will start up.

Then you can (in a separate shell window):

`docker ps | grep salt-master`

and get the id of the container running the master (something like `2e321e3f1fbf`).

Then you can attach to the master and run commands:

`docker exec -it <id> bash`  (something like `docker exec -it 2e321e3f1fbf bash`)

From that command line you can run something like:

`salt '*' test.ping`

and in the window where you started docker compose, you will see the log output of both the master sending the command and the minion receiving the command and replying.
