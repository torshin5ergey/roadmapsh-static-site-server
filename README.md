# 🌐 Static Site Server Project for [roadmap.sh](https://roadmap.sh/)

This is my solution to the [Static Site Server project](https://roadmap.sh/projects/static-site-server) in the [DevOps roadmap](https://roadmap.sh/devops) from [roadmap.sh](https://roadmap.sh/)

**Table of Contents**
- [References](#references)
- [Project Requirements](#project-requirements)
- [Prerequisites](#prerequisites)
- [Statis Site Server Setup Steps](#statis-site-server-setup-steps)
- [Credits](#credits)
- [Author](#author)

## References

- [Installing NGINX Open Source](https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/)

## Project Requirements

- Register and setup a remote linux server on any provider.
- Make sure that you can connect to your server using SSH.
- Install and configure nginx to serve a static site.
- Create a simple webpage with basic HTML, CSS and image files.
- Use rsync to update a remote server with a local static site.
- If you have a domain name, point it to your server and serve your static site from there. Alternatively, set up your nginx server to serve the static site from the server’s IP address.

## Prerequisites

- A remote server (Ubuntu Server 22.04) with configured SSH access

## Statis Site Server Setup Steps

0. SSH to your remote server

1. Install NGINX Open Source
- Update and install NGINX with `apt`
```bash
sudo apt update && sudo apt install nginx -y
```
- Verify installation
```bash
sudo nginx -v
```
- Check nginx.service status
```bash
sudo systemctl status nginx
```
- Now you can open the **Welcome to nginx!** page by typing the IP address of your server in the address bar of your browser

2. Use `rsync` to update a remote server with a local static site
- Install `rsync` on your **local host**
```bash
sudo apt update && sudo apt install rsync
```
- Set Nginx webcontent directory permissions and add user to default web server group
```bash
sudo usermod -aG www-data username
sudo chmod -R 755 /var/www/html
```
- `rsync` files to remote server
```bash
# -a, --archive archive mode, save directory structure, permissions, owner, etc
# -z, --compress compress transmitted data
# --delete delete extraneous files from the destination
rsync -avz --delete website/ username@hostip:/var/www/html/
```
- Reload Nginx to apply new files
```bash
sudo systemctl reload nginx
```
- Open transmitted page by typing the IP address of your server in the address bar of your browser

## Credits

- HARDER RAVE FINAL BY KRIS KLAVENES.wav by klavo1985 -- https://freesound.org/s/388278/ -- License: Attribution 4.0

## Author

Sergey Torshin [@torshin5ergey](https://github.com/torshin5ergey)
