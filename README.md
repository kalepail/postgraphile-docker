```bash
docker run --rm -d \
  -p 5000:5000 \
  --name "stellar-graphql" \
  docker_stellar_graphql \
  --connection postgres://{user}:{password}@{ip}:{port}/{database}
```