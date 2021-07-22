FROM pagespeed/nginx-pagespeed
# use image below instead if you need power of Lua in your Nginx
# FROM romanmelnyk/ngxpagespeed-lua

# Install curl
RUN apk add --no-cache curl

# Make sure folder exists
RUN mkdir /usr/local/sbin

# Step 1
RUN wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
RUN chmod +x /usr/local/sbin/install-ngxblocker

# Step 2 - Skipped since it's a DRY run

# Step 3
RUN /usr/local/sbin/install-ngxblocker -x
RUN chmod +x /usr/local/sbin/setup-ngxblocker
RUN chmod +x /usr/local/sbin/update-ngxblocker

# Step 4 - Skipped since it's a DRY run

COPY whitelist-ips.conf /etc/nginx/bots.d/whitelist-ips.conf
COPY whitelist-domains.conf /etc/nginx/bots.d/whitelist-domains.conf
COPY blacklist-user-agents.conf /etc/nginx/bots.d/blacklist-user-agents.conf
COPY blacklist-ips.conf /etc/nginx/bots.d/blacklist-ips.conf
COPY bad-referrer-words.conf /etc/nginx/bots.d/bad-referrer-words.conf
COPY custom-bad-referrers.conf /etc/nginx/bots.d/custom-bad-referrers.conf

# Step 5
RUN /usr/local/sbin/setup-ngxblocker -x -e conf
