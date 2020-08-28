<div align="center">
  <h1>Nginx bad bots blocker</h1>
</div>


This project contains a basic setup of
 https://github.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker
 based on `pagespeed/nginx-pagespeed` docker image

## IMPROTANT
Make sure to include lines below to your nginx vhost configuration
```
    # Bad Bot Blocker taken from
    include /etc/nginx/bots.d/ddos.conf;
    include /etc/nginx/bots.d/blockbots.conf;
```

### Customization
You can now customize any of the following files below to suit
 your environment or requirements.
 These include files will be used during docker build. So feel free
 if you need to add/remove some IP/domain to/from blacklist/whitelist
```
/etc/nginx/bots.d/whitelist-ips.conf
/etc/nginx/bots.d/whitelist-domains.conf
/etc/nginx/bots.d/blacklist-user-agents.conf
/etc/nginx/bots.d/blacklist-ips.conf
/etc/nginx/bots.d/bad-referrer-words.conf
/etc/nginx/bots.d/custom-bad-referrers.conf
```
Let's say for some "obscure" reason you actually want to block GoogleBot from accessing your site. You would simply add it to the /etc/nginx/bots.d/blacklist-user-agents.conf file and it will over-ride the default whitelist for GoogleBot. the same applies to any other bots that are whitelisted by default.

All include files are commented for your convenience.

