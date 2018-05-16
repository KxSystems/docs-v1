---
hero: <i class="fa fa-share-alt"></i> Machine learning
title: Set up your machine-learning environment
keywords: Docker, embedPy, Jupyter, ml, machine learning, Python
---

# Set up your machine-learning environment

There are three ways to set up an environment in which to work on Machine Learning.


## Docker command

1. Install [Docker](https://www.docker.com/community-edition) 
2. Create a directory `q` and save your `kc.lic` (or `k4.lic`) and `l64.zip` files in it
4. Run:

```bash
$ docker run --rm -it -v `pwd`/q:/tmp/q kxsys/embedpy
kx@1ba5d6c29709:~$ q
KDB+ 3.5 2017.11.08 Copyright (C) 1993-2017 Kx Systems
l64/ 4(16)core 7905MB kx 0123456789ab 172.17.0.2 EXPIRE 2018.12.04 bob@example.com KOD #0000000

q)
```
You can drop straight into q with:
```bash
$ docker run --rm -it -v `pwd`/q:/tmp/q kxsys/embedpy q
KDB+ 3.5 2017.11.08 Copyright (C) 1993-2017 Kx Systems
l64/ 4(16)core 7905MB kx 0123456789ab 172.17.0.2 EXPIRE 2018.12.04 bob@example.com KOD #0000000

q)
```
Lastly you can also pipe your program in:
```bash
$ echo 'p)print(1+2)' | docker run --rm -i -v `pwd`/q:/tmp/q kxsys/embedpy q -q
3
```


## Download via Anaconda

The three Kx packages can be downloaded from [anaconda.org/kx](https://anaconda.org/kx):

-   `kdb`
-   `embedpy`
-   `jupyterq`

They are in a dependency tree. If you install `embedpy` it will automatically install `kdb`. If you install `jupyterq`  it will install `embedpy` and `kdb`. 

The commands are as follows:
```bash
conda install -c kx kdb
conda install -c kx embedpy
conda install -c kx jupyterq
```
When you first run q it will ask the following questions:
```
Please provide your email (requires validation):
Please provide your name:
If applicable please provide your company name (press enter for none):
```
This will then reach out to the Kx license server and generate a `kc.lic`.

This in turn sends an email confirmation link to validate the license file.


## Do it yourself

1. Install [kdb+](/tutorials/install) 
2. Install [embedPy](embedPy)
3. Install [JupyterQ](jupyterq)