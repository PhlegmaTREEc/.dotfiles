## How to do this

- [link](https://mauriceneuer.medium.com/foundryvtt-and-docker-2918a9db43ad)
- `cd` to chosen directory
  - `mkdir app data`
  - put .env compose.yml Dockerfile there
  - do `wget -O foundryvtt.zip "download link here"` for latest node.js
  - `ls` should look like `app  compose.yml  data  Dockerfile  .env  foundryvtt.zip`
- no changes to location need
- just `docker compose up -d` and profit
