# Qwiklabs Cloud Shell setup

This repo contains a basic Cloud Shell setup for Qwiklabs, including:

- Persistence settings for Qwiklabs so things like GCP Project ID, Region or installed packages are not lost upon Cloud Shell VM restarts
- Customized prompt for Git integration and long paths
- Some Cloud Shell Editor configurations (Dark Theme, tabs to 2 spaces...)

To install in your Qwiklabs project, open a Cloud Shell in your Qwiklabs project and do a minimum setup (this step will be required once during the whole duration of the lab):

```bash
export PROJECT_ID=<your-qwiklabs-project-id>
export GIT_BRANCH=dev
```

Then, run the Cloud Shell configuration:

```bash
CS_SOURCE="https://raw.githubusercontent.com/javiercanadillas/qwiklabs-cloudshell-setup/${GIT_BRANCH:-main}/setup_qw_cs"
bash <(curl -s "$CS_SOURCE") && exec $SHELL -l
```

If you just want to download the file first, make modifications and then run it, do the following:

```bash
# Download the file
CS_SETUP="setup_qw_cs"
CS_SOURCE="https://raw.githubusercontent.com/javiercanadillas/qwiklabs-cloudshell-setup/${GIT_BRANCH:-main}/$CS_SETUP"
curl -s "$CS_SOURCE" -o "$HOME/$CS_SETUP"
# Now Make your modifications using your favorite editor
```

And once done, run it:

```bash
bash -x "$HOME/$CS_SETUP"
```

## Adding post script customizations

`setup_qw_cs` sources `$HOME/.labenv_custom.bash`. If you desire more customizations to your cloudshell, you can add them there.
