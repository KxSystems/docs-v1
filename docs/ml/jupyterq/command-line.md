hero: Machine learning

# Server command-line arguments


You can set command-line arguments for the q server process by modifying `kernel.json`.

The default `kernel.json` file looks like this:
```json
{
 "argv": [
  "q",
  "jupyterq_kernel.q",
  "-cds",
  "{connection_file}"
 ],
 "display_name": "Q 3.5",
 "language": "q",
 "env": {"JUPYTERQ_SERVERARGS":""}
}
```
If you wanted to set the default timer interval to 1 second and a workspace limit of 500Mb you would modify it to look like this:
```json
{
 "argv": [
  "q",
  "jupyterq_kernel.q",
  "-cds",
  "{connection_file}"
 ],
 "display_name": "Q 3.5",
 "language": "q",
 "env": {"JUPYTERQ_SERVERARGS":"-t 1000 -w 500"}
}
```
To locate the `kernel.json` config file after install run:
```bash
jupyter kernelspec list
```
