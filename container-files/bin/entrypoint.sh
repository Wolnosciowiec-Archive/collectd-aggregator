#!/bin/bash

set -xe

j2 /etc/collectd/collectd.conf.j2 > /etc/collectd/collectd.conf
exec supervisord -n -c /etc/supervisor/supervisord.conf

