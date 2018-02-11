```bash
docker run --rm -d \
  -p 5000:5000 \
  --name postgraphile \
  tyvdh/postgraphile \
  --connection postgres://{user}:{password}@{ip}:{port}/{database}
```