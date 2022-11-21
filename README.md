# IP_Finder

Lets send you servers ip on reboot to a Discord Webhook

## Install

**Create script directory** 

```sh
mkdir /etc/rg_ipfinder
```

**Download ip.bash to /etc/rg_ipfinder/ip.bash**

```sh
curl https://raw.githubusercontent.com/riseupgroup/ip_finder/main/ip.bash > /etc/rg_ipfinder/ip.bash
```

**Replace "\<your discord webhook here\>" on line 8 with your own webhook**

```sh
nano /etc/rg_ipfinder/ip.bash
```

**Make the script executable**

```sh
chmod +x /etc/rg_ipfinder/ip.bash
```

**It should look like this**

```sh
discord_url="https://discord.com/api/webhooks/123123/asdasd"
```

Save with CTRL + X

**Add the script to crontab**

Open Crontab config as root (otherwiese you can't use @reboot)

```sh
sudo crontab -e
```

Add the script

```sh
@reboot /etc/rg_ipfinder/ip.bash
```

Save with CTRL + X

