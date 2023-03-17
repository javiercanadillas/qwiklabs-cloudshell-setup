# Qwiklabs Cloud Shell setup

This repo contains a basic Cloud Shell setup for Qwiklabs, including:

- Persistence settings for Qwiklabs so things like GCP Project ID, Region or installed packages are not lost upon Cloud Shell VM restarts
- Customized prompt for Git integration and long paths

To install in your Qwiklabs project, open a Cloud Shell in your Qwiklabs project and run:

```bash
gcloud config project set <your-qwiklabs-project-id>
gcloud config set compute/region <your-preferred-cloud-region>
bash <(curl -s https://github.com/javiercanadillas/qwiklabs-cloudshell-setup/setup_qw_cs)
```