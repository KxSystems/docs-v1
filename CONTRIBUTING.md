# Contributing

It is simple to get started and contribute to the new documentation on code.kx.com.

In the case of small typos you can simply fork the repository, or click edit button on GitHub, which will automatically fork the repository to your account. Make a change and create a pull request for the main repository.
One of the admins will review your change and provide feedback on possible improvements – or just merge it in.

For larger changes it is worth considering establishing a local development setup before creating your pull request. Many users rely on code.kx.com for their daily work and you would not want to see some half-baked pages merged in.

Install the [MkDocs](http://mkdocs.org) package using your packaging tool of choice:
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

Run your development server:
```bash
mkdocs serve
```

This will start a web server on `http://localhost:8000` where you could see the entire website – with hot-reload when you save a change.
