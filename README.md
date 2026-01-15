## How to run Docker containers

To run a specific Docker container, rename `<container_name>.example.env` to `<container_name>.env`, adjust the environment
variables if needed, and run:

```bash
docker compose up -d <container_name>
```