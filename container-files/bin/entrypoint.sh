#!/bin/bash

set -xe

j2 /etc/collectd/collectd.conf.j2 > /etc/collectd/collectd.conf
exec collectd -f -C /etc/collectd/collectd.conf
