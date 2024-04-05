### <b style="color:green;">What is Docker?</b>

Created in March 2013, is an open-source containerization platform that simplifies application development and deployment by packaging applications in lightweight, isolated containers for consistent execution across various environments.


<p class="fragment ">... <a href="https://www.docker.com/pricing/faq/#subscriptionandlicensing">and it's paid</a> "for organizations with more than 250 employees or more than $10 million in annual revenue"</p>

---

#### <b style="color:green;">How Docker works?</b>

There are a few things good to understand

<ul>
  <li class="fragment">
    <a href="https://learn.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/containerd#windows-and-linux-container-platform"><b style="color:gray">Docker architecture</b></a> This explains the Docker Engine, how it's implemented in the operational system, etc.
  </li>
  <li class="fragment">
    <a href="https://docs.docker.com/engine/reference/builder/"><b style="color:gray">Dockerfile</b></a> This is the file where you put the instructions to build your Docker container
  </li>
  <li class="fragment">
    <a href="https://docs.docker.com/engine/reference/builder/#dockerignore-file"><b style="color:gray">.dockerignore</b></a> This file where you can ignore other files, so Docker Daemon won't load it during the build, making it faster to build. It's similar to the '.gitignore'
  </li>
  <li class="fragment">
    <a href="https://docs.docker.com/build/guide/layers/"><b style="color:gray">Docker layers and cache</b></a> Each instruction in the Dockerfile will become a layer, following the same sequence. A change in a layer, will affect all the next layers. You image will always inherit from the base image
  </li>
  <li class="fragment">
    <a href="https://docs.docker.com/build/guide/multi-stage/"><b style="color:gray">Multi-stage building</b></a> Each stage will run in parallel, making the build to run much faster
  </li>
</ul>

---

#### <b style="color:green;">Docker architecture in Linux</b>


[![Docker on Linux](assets/docker-on-linux.png)](https://learn.microsoft.com/en-us/virtualization/windowscontainers/deploy-containers/containerd#windows-and-linux-container-platform)

---

#### <b style="color:green;">Dockerfile and its layers</b>

Each instruction (e.g. `FROM`, `WORKDIR`, `COPY`, etc) in the Dockerfile will become a layer, following the same sequence

[![Dockerfile and its layers](assets/docker-layers.png)](https://docs.docker.com/build/guide/layers/)

---

#### <b style="color:green;">.dockerignore file</b>

The .dockerignore file excludes matching files and directories from being sent to the Docker daemon, optimizing the build process and preventing unnecessary additions to images, such as large or sensitive files

* <b style="color:gray">Syntax</b> It follows a similar syntax to .gitignore
* <b style="color:gray">Efficiency</b> Files matching patterns in .dockerignore are excluded from the Docker build context, making the build process becomes faster
* <b style="color:gray">Common exclusions</b> .git, .svn, node_modules, build artifacts, temporary files, log files, and irrelevant files
* <b style="color:gray">Context limitation</b> .dockerignore impacts build context, not final image; Dockerfile must explicitly include files needed for application runtime

Check more here: [Dockerfile reference .dockerignore file](https://docs.docker.com/engine/reference/builder/#dockerignore-file)

---

#### <b style="color:green;">Multi-stage building</b>

```Dockerfile
FROM golang:1.20-alpine AS base                ## Stage base
WORKDIR /src
COPY go.mod go.sum .
RUN go mod download
COPY . .

FROM base AS build-client                      ## Stage build-client
RUN go build -o /bin/client ./cmd/client

FROM base AS build-server                      ## Stage build-server
RUN go build -o /bin/server ./cmd/server

FROM scratch                                   ## This is the one that will be final version with 3 layers + layers from the base image (scratch)
COPY --from=build-client /bin/client /bin/
COPY --from=build-server /bin/server /bin/

ENTRYPOINT [ "/bin/server" ]
```

---

#### <b style="color:green;">Multi-stage building</b>

![Docker multi-stage building](assets/docker-build-parallelism.gif)