# This state installs NGINX and then copies all the files from the /srv/salt/webserver/html directory to all the minions, and restarts NGINX
# In a default saltstack insallation this goes in the /srv/salt/webserver directory as a file named init.sls

Validate That NGINX is Installed:
  pkg.installed:
    - name: nginx

Copy Webserver HTML Files from Master to Minions:
  file.recurse:
    - name: /user/share/nginx/html/
    - source: salt://webserver/html/
    - group: nginx
    - require:
      - pkg: nginx

Restart NGINX:
  cmd.run:
    - name: nginx -s stop; nginx
