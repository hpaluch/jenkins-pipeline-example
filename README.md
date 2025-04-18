# Jenkins Pipeline job example

Here is basic Jenkins "Declarative" Pipeline example project - it builds Hello, World in C under
Linux. Note: see https://www.jenkins.io/doc/book/pipeline/#declarative-versus-scripted-pipeline-syntax for
explanation of Declarative vs. Scripted Pipeline syntax.

All code tested under Debian 12. Requirements:
- installed and Running Jenkins, tested version `2.506`,
  see https://www.jenkins.io/doc/book/installing/linux/#debian-weekly for instructions
- have working Linux node with `gcc` and `make` installed, in 
  case of Debian you have to run `sudo apt-get install gcc make git`. 
  See https://www.jenkins.io/doc/book/using/using-agents/ for general instructions how to
  configure Jenkins Node (also known as "Agent")
- that Linux Node must have one of labels `linux` - referenced from this [Jenkinsfile](Jenkinsfile)
- you have to define e-mail recipient variable under (referenced in this Pipeline):
  - Jenkins Web UI -> Manage Jenkins -> System -> Environment variables
    - Name: `NOTIFICATION_EMAIL`
    - Value (example): `username@localhost`

You have to create and/or import Jenkins job from [job/config.xml](job/config.xml).
- see `https://YOUR_JENKINS_FQDN/manage/cli/command/create-job` for instructions

Then you can finally invoke from Your Jenkins job called `hello-c-github` - after a while
it should succeed.

