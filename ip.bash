#!/bin/bash

while ! timeout 0.2 ping -c 1 -n 1.1.1.1 &> /dev/null
do
    sleep 1
done

discord_url="<your discord webhook here>"
icon_url="https://github.com/riseupgroup.png"
board=""
while IFS= read -r -d '' substring || [[ $substring ]]; do
  board+="$substring"
done </sys/firmware/devicetree/base/model

generate_post_data() {
  cat <<EOF
{
  "avatar_url": "$icon_url",
  "embeds": [{
    "title": "$board",
    "color": "45973",
    "fields": [
        {
          "name": "Hostname:",
          "value": "$(hostname)",
          "inline": true
        },
        {
          "name": "IP:",
          "value": "$(hostname -I)",
          "inline": true
        }
    ],
    "footer": {
        "text": "$(date)",
        "icon_url": "$icon_url"
      }
  }]
}
EOF
}

curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data)" $discord_url