### <b style="color:green;">How container works?</b>

![Container vs VM](assets/container-vs-vm.png)

* Runs in the same operating system as its host
* Shares the host's kernel and resources

---

#### <b style="color:green;">Does it matter where I run it?</b>

Short answer: it depends, but most likely no

![It works on my ...](assets/it-works-on-my-meme.jpeg)

---

#### <b style="color:green;">Container and its dependencies</b>

Essentially, the container is influenced by the host system's operating system kernel and resources, such as system libraries and the CPU. This doesn't necessarily impact the container's behaviour because it isolates and encapsulates the application and its dependencies within the container, ensuring that the container operates reliably and consistently regardless of the host system's specifics.

---

#### <b style="color:green;">Possible differences between hosts</b>

... but there are a few cases that can change, not necesserly impacting your application.

* It can differ based on the CPU architecture due to the kernel supported features for that architecture - e.g. x86_64 vs ARM
* It can differ between kernel versions and types
* It can differ based on kernel features enabled

> Docker takes in consideration your CPU architecture. For example, you can't run a container built in a Mac M2 CPU (ARM) in a Mac Intel CPU (x86_64)

---

#### <b style="color:green;">Kernel parameters diffs</b>

This is comparing Amazon Linux 2023 ARM vs x86_64

![Kernel parameters diffs](assets/docker-arm-vs-x86_64.png)

* Kernel parameters' default values and supported configurations can vary based on factors like CPU architecture and operating system

---

#### <b style="color:green;">Kernel parameters diff impact</b>

* Different values in kernel parameters can be changed without causing problems
* However, when default values are used, application performance may vary across machines
* Default value differences in kernel parameters can affect application speed, particularly for high-workload applications
* Applications may exhibit varying performance on different machines due to kernel parameter variations

---

#### <b style="color:green;">Factors affecting app performance</b>

Factors impacting application speed across machines

* CPU architecture differences (ARM vs x86_64)
* Other running processes on the machine
* Varied system resources

---

#### <b style="color:green;">Cases that may change based on the Kernel</b>

* You want to do a tuning/change in a specific kernel parameter (via sysctl) that's not supported
* Your application has some sort of interaction with the kernel and not all operational systems supports it. Considering this application is running as privileged

> These are the cases I had in the past or I could think of, there maybe more cases.

Check the [Runtime Requirements for containerd](https://github.com/containerd/containerd/blob/main/README.md#runtime-requirements) for more information
