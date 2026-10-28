# Nginx, Docker, and TLS Practice

A small interview-revision project: three Node.js/Express containers behind an Nginx reverse proxy, with HTTPS for local practice.

## Run locally

1. Install Docker Desktop and make sure its engine is running.
2. Create a local certificate and key (do not commit these files):
   ```bash
   mkdir -p nginx-certs
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout nginx-certs/localhost.key \
     -out nginx-certs/localhost.crt \
     -subj "/CN=localhost" \
     -addext "subjectAltName=DNS:localhost,IP:127.0.0.1"
   ```
   In PowerShell, create the directory first with `New-Item -ItemType Directory -Force nginx-certs`.
3. Build and start the services: `docker-compose up --build -d`.
4. Open `https://localhost:8443`. A self-signed certificate is not trusted by browsers; the warning is expected in this local exercise.
5. HTTP on `http://localhost:8080` redirects to HTTPS. Each app is also published directly on ports 30001, 30002, and 30003.

## Useful commands

```bash
docker-compose ps
docker-compose logs -f nginx app1 app2 app3
docker-compose exec nginx nginx -t
docker-compose exec nginx nginx -s reload
docker-compose down
```

Edit `nginx.conf`, test it with `nginx -t`, then reload Nginx inside its container. The `nginx` executable is not installed on the Windows host.

## Concepts to remember

- Docker images are built from a Dockerfile; containers are running instances of images.
- Docker Compose describes related services, networks, port mappings, and mounts in one YAML file.
- Each app listens on container port 3000; Compose publishes host ports 30001–30003 for direct access.
- Compose services share a network and can find one another by service name, such as `app1`.
- Nginx is a reverse proxy: clients connect to it, and it forwards requests to an app upstream.
- The `least_conn` load-balancing method chooses an upstream with fewer active connections; it does not promise round-robin responses.
- Bind mounts expose host files to containers; the Nginx config and local TLS certificate directory are mounted read-only.
- `nginx.conf` is mounted into `conf.d`, so it contains `upstream` and `server` blocks, not main-context `events` or `http` blocks.
- TLS protects traffic between the client and Nginx; this setup terminates TLS at Nginx and uses HTTP to reach the app containers.
- A certificate contains a public key and identity information; the matching private key must remain secret.
- A self-signed certificate is useful for learning, but browsers do not trust it by default; production certificates should chain to a trusted CA.
- Subject Alternative Names (SANs) identify the hostnames/IPs a certificate is valid for; this local certificate names `localhost`.
- `nginx -t` checks configuration syntax and referenced files; a successful test does not prove browser trust or application correctness.
- `.gitignore` prevents local secrets and dependencies from being committed; `.dockerignore` keeps unnecessary files out of the image build context.
