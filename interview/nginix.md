# Nginx interview questions

1. **What is Nginx?**

A web server that can also act as a reverse proxy, load balancer, and HTTP cache.

2. **What is a reverse proxy?**

A server-side intermediary that accepts client requests and forwards them to backend services.

3. **What is the difference between a forward proxy and a reverse proxy?**

A forward proxy represents clients; a reverse proxy represents servers to clients.

4. **What is an upstream in Nginx?**

A named group of backend servers to which Nginx can proxy requests.

5. **What is Nginx's default upstream load-balancing method?**

Round robin, which distributes requests among servers in sequence.

6. **What does `least_conn` do?**

It selects the available upstream server with the fewest active connections; it does not guarantee equal request counts.

7. **What does `proxy_pass` do?**

It forwards a request from a `location` block to a specified upstream or URL.

8. **Why do Compose services use names such as `app1:3000` in the upstream?**

Compose provides service-name DNS on its project network, so containers can reach each other without host-published ports.

9. **What is the difference between `listen` and `server_name`?**

`listen` selects the local address/port; `server_name` matches the requested host name.

10. **What are Nginx configuration contexts?**

 Directives belong to contexts such as main, `events`, `http`, `server`, and `location`; directives must be placed where allowed.

11. **Why can a file mounted into `conf.d` not contain `events` or `http` blocks?**

 The main Nginx config already includes `conf.d` from within its `http` context; included files should define items such as `server` and `upstream`.

12. **What is TLS termination?**

 Nginx handles the client's HTTPS connection and decrypts it before proxying to a backend.

13. **Why forward `X-Forwarded-For` and `X-Forwarded-Proto`?**

 They communicate the original client address and request scheme to the backend.

14. **How do you validate and reload an Nginx config in this project?**

 Run `docker-compose exec nginx nginx -t`, then `docker-compose exec nginx nginx -s reload`.

15. **What is the difference between reloading and restarting Nginx?**

 A reload validates and applies configuration gracefully; a restart stops and starts the process/container.

16. **What does a 502 Bad Gateway often indicate?**

 Nginx could not get a valid response from an upstream; check service health, DNS/network, port, and backend logs.

17. **Does `depends_on` guarantee an app is ready to serve requests?**

 No. It controls startup order, not application readiness; use health checks and readiness-aware dependencies when needed.

18. **How does this project redirect HTTP to HTTPS?**

 The port-80 server returns a 301 redirect to the published HTTPS port, 8443.

19. **Does open-source Nginx actively health-check upstreams by default?**

 No; passive failure handling is available, while active health checks are an Nginx Plus feature or require another solution.

20. **How would you make requests identify which app served them?**

 Return an app identifier in a response header/body or log it; this app currently writes the identifier to each app's logs.
