```bash
docker build -t "tinyanvil/postgraphile" .
docker run --rm -it \
  -p 5000:5000 \
  -e USER={username} \
  -e PASS={password} \
  -e HOST={hostname} \
  -e PORT={port} \
  -e DB={database} \
  -e SCHEMA={schema} \
  "tinyanvil/postgraphile:latest"
```
