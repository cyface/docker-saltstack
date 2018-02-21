nginx:
  pkg.installed

/etc/nginx/conf.d/default.conf:
  file.managed:
    - source: salt://webserver/default.conf
    - require:
      - pkg: nginx

/usr/share/nginx/html/:
  file.recurse:
    - source: salt://webserver/html/
    - group: nginx
    - require:
      - pkg: nginx

/run/nginx/:
  file.directory

Run Nginx:
  cmd.run:
    - name: nginx -s stop; nginx
