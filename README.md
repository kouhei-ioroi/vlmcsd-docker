# VLMCSD for Docker

Deploy vlmcsd service on Docker container

```bash
git clone https://github.com/Wind4/vlmcsd-docker.git vlmcsd
cd vlmcsd

# Use docker-compose service
docker-compose up -d

# or docker build image
docker build -t vlmcsd .
docker run -d --name vlmcsd -p 1688:1688 vlmcsd

# show logs
docker logs -f vlmcsd

# foreground (directly prints logs to terminal)
docker run --rm -p 1688:1688 vlmcsd
```
