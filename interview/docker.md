# Docker interview questions

1. **What is Docker?**

A platform for building and running applications in isolated containers.

2. **What is the difference between an image and a container?**

An image is an immutable template; a container is a running or stopped instance created from it.

3. **What is a Dockerfile?**

A set of instructions used by Docker to build an image.

4. **What is Docker Compose?**

A tool for defining and managing a multi-container application using a Compose YAML file.

5. **What is the difference between `docker build` and `docker run`?**

`build` creates an image; `run` creates and starts a container from an image.

6. **What do `docker-compose up --build -d` do?**

It builds images if needed, creates/starts the Compose services, and detaches the command from their logs.

7. **What is a port mapping such as `30001:3000`?**

It maps host port 30001 to container port 3000; the left side is the host port.

8. **What is the difference between `EXPOSE` and Compose `ports`?**

`EXPOSE` documents a container port; `ports` publishes a port to the host.

9. **How do containers in a Compose project communicate?**

They use the shared Compose network and resolve one another by service name and container port.

10. **What is the difference between a bind mount and a named volume?**

 A bind mount maps a specific host path; a named volume is managed by Docker and is better suited to persistent container data.

11. **What is the difference between `CMD` and `ENTRYPOINT`?**

 `ENTRYPOINT` defines the main executable; `CMD` supplies default arguments or a default command that can be overridden.

12. **What is the difference between `COPY` and `ADD`?**

 `COPY` copies files; `ADD` also supports features such as local archive extraction, so `COPY` is preferred for ordinary copies.

13. **What are image layers and build cache?**

 Build instructions create reusable layers; unchanged earlier layers can be cached to speed later builds.

14. **What is `.dockerignore` for?**

 It excludes files from the build context, reducing transfer/build time and avoiding accidental inclusion of local files.

15. **What is `.gitignore` for, and how is it different from `.dockerignore`?**

 `.gitignore` excludes files from Git; `.dockerignore` excludes files from Docker build contexts. Neither automatically replaces the other.

16. **Why should secrets not be baked into an image?**

 Image layers can persist and be shared; inject secrets securely at runtime and keep them out of source control and build contexts.

17. **What does `depends_on` guarantee in Compose?**

 It controls service startup/shutdown ordering, but basic startup ordering does not guarantee application readiness.

18. **How do you inspect a failing container?**

 Use `docker-compose ps`, `docker-compose logs <service>`, and `docker-compose exec <service> <command>` when it is running.

19. **What is the purpose of environment variables in a container?**

 They configure an application at runtime without hardcoding deployment-specific values into the image.

20. **Why use a small base image and a `.dockerignore` file?**

 They reduce image size and build context, improving transfer speed and reducing unnecessary contents.
