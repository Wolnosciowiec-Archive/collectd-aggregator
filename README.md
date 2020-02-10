# collectd-aggregator

Collectd server that aggregates results of other collectd instances and passes to InfluxDB

![collectd](./docs/diagram.png)

## Architecture

Works as an aggregator of other collectd instances data.
On worker nodes the collectd instances should send the collected data using encrypted channel to this aggregator instance.
Then this aggregator instance should send the data to InfluxDB or other database.

## Setup

1. Environment variables

```bash
# address where to pass the data eg. InfluxDB instance
FORWARD_ADDRESS=1.2.3.4 
FORWARD_PORT=25826
```

Copyleft
--------

Created by **RiotKit Collective**, a libertarian, grassroot, non-profit organization providing technical support for the non-profit Anarchist movement.

Check out those initiatives:
- International Workers Association (https://iwa-ait.org)
- Federacja Anarchistyczna (http://federacja-anarchistyczna.pl)
- Związek Syndykalistów Polski (https://zsp.net.pl) (Polish section of IWA-AIT)
- Komitet Obrony Praw Lokatorów (https://lokatorzy.info.pl)
- Solidarity Federation (https://solfed.org.uk)
- Priama Akcia (https://priamaakcia.sk)
