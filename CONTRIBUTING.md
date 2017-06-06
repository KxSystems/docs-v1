# Contributing to documention

It is simple to get started and contribute to the new documentation on [code.kx.com].

In case of small typos you can simply fork(or click edit button on github which will automatically fork repository to your account). Make a change and create a pull request(PR) for the main repository.
One of the admins will review your change and provide feedback on possible improvements or just merge.


For larger changes it is worth considering establishing local development setup before creating pull request. Many users rely on code.kx.com for their daily work and you would not want to see some half baked pages.

Install mkdocs package using packaging tool of choice
```bash
brew install mkdocs # for macOS
sudo apt install mkdocs # Ubuntu
sudo yum install mkdocs # CentOS/RHEL
```
There are some additional packages and fonts required:
```bash
pip install mkdocs-material
pip install fontawesome_markdown
```


Run development server
```
mkdocs serve
```

This will start a web server on `http://localhost:8000` where you could see entire website with hot-reload when you make a change.
