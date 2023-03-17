# Qwiklabs Cloud Shell setup

This repo contains a basic Cloud Shell setup for Qwiklabs, including:

- Persistence settings for Qwiklabs so things like GCP Project ID, Region or installed packages are not lost upon Cloud Shell VM restarts
- Customized prompt for Git integration and long paths
- Some Cloud Shell Editor configurations (Dark Theme, tabs to 2 spaces...)

To install in your Qwiklabs project, open a Cloud Shell in your Qwiklabs project and do a minimum setup (this step will be required once during the whole duration of the lab):

```bash
gcloud config project set <your-qwiklabs-project-id>
gcloud config set compute/region <your-preferred-cloud-region>
```

Then, run the Cloud Shell configuration:

```bash
bash <(curl -s https://raw.githubusercontent.com/javiercanadillas/qwiklabs-cloudshell-setup/main/setup_qw_cs)
```