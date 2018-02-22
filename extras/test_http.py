# In a default saltstack installation, this needs to go in /var/cache/salt/master/extmods/runners/
# You invoke it with 
#  salt-run test_http.test
# And it will do a quick http check against each minion to see what comes back
from salt.utils import http
from salt import client

def test():
  print("Testing HTTP Against Each Minion")
  cli = client.LocalClient(__opts__['conf_file'])
  minions = cli.cmd('*', 'test.ping', timeout=1)
  success = True
  for minion in sorted(minions):
     result = http.query('http://{}'.format(minion), status=True)
     if result['status'] != 200:
        success = False
     print("{}: {}".format(minion, result['body']))
  return success

