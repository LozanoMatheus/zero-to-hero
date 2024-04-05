### <b style="color:green;">Bad practices</b>

* Docker != VM
  * 1 app == 1 container
  * Installing or updating in a running container
  * Using automations inside your container (e.g. Ansible, Shell)
* DinD
* Image per environment
* Adding sensitive content to the container, such as secrets
* Building the application artifacts separed from the container

---

### <b style="color:green;">Bad practices - DinD</b>

https://devops.stackexchange.com/a/681
https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
https://www.trendmicro.com/en_in/research/19/l/why-running-a-privileged-container-in-docker-is-a-bad-idea.html

Use kaniko, buildah

WIP

---

### <b style="color:green;">Bad practices - Image per environmet</b>

https://devops.stackexchange.com/a/681
https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
https://www.trendmicro.com/en_in/research/19/l/why-running-a-privileged-container-in-docker-is-a-bad-idea.html

WIP

-----

### <b style="color:green;">Best practices - Priviledged user</b>

WIP

-----

### <b style="color:green;">Best practices - Cached layers</b>

WIP

-----

### <b style="color:green;">Best practices - Multi-stage</b>

WIP

-----

### <b style="color:green;">Best practices - Slim image</b>

```bash
docker image ls
docker history --no-trunc <image_id_or_name>
```

* [Slim](https://github.com/slimtoolkit/slim)

WIP

-----

### <b style="color:green;">Best practices - Multi-platform</b>

WIP

-----

### <b style="color:green;">CI/CD - Share tarball</b>

WIP

-----

### <b style="color:green;">CI/CD - Security scan</b>

https://github.com/quay/clair
AWS ECR

WIP

-----

### <b style="color:green;">Extras - Logdriver</b>

WIP

-----

### <b style="color:green;">Extras - Gracefully stop</b>

"Issue" PID 1 - e.g. using script

User exec, dumb-init, tini

WIP

-----

### <b style="color:green;">Extras - rootless container</b>

podman

WIP

-----

### <b style="color:green;">Extras - Keeping the local machine clean</b>

Install tools on Docker and create a Shell alias to call them

```bash
alias node="docker rm --rm -it node:18.16 ${@}"
alias npm="docker rm --rm -it node:18.16 ${@}"
```

WIP
