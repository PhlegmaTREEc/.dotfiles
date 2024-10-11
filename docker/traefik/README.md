# Traefik v3

- Sources:

  - [TechnoTim](https://technotim.live/posts/traefik-3-docker-certificates/)

## Quick notes

- ./cf_api_token.txt - put the Cloudflare token here

- ./.env put the hashed credentials here

- Pi-hole DNS Rewrites

  - DNS Records ```traffic.local.phlegmatreec.com``` pointing to the IP of the VM
  - CNAME Record ```traefik-dashboard.local.phlegmatreec.com``` (domain specified in compose.yml) pointing to DNS record of the VM (previous line)
