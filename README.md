# PaperMosaik

## Setup

### Before creating a new image

> This step must be done only once

In order to the clone this repo, you must first create a **gitlab access token**, .

To do so:

1. Click on your profile picture in the top left of the screen
1. Select access `Access Tokens` in the sidebar
1. Click on the `Add new token` button
1. Give the token a name, e.g. `Pharo PaperMosaik`
1. Give the token a reasonable expiring date, e.g. `2023-12-31`
1. Check the `read_api` checkbox
1. Check the `read_repository` checkbox
1. Check the `write_repository` checkbox
1. Click on the `Create personal access token`

![access token creation](https://i.imgur.com/kZxck13.png)
![access token permissions](https://i.imgur.com/xTQBH9F.png)

### Create the new image

In order to setup a new Pharo 10 image with the code present on the main branch,
please follow the following steps:

1. Click on the `New` icon on the top left of the pharo launcher
1. Select the `Official distributions` template category
1. Select the `Pharo 10.0 - 64bit (old stable)` template
1. Give the image a name, e.g. `PaperMosaik`
1. Click on the pen icon

**NOTE**: if you have already created the init script, you can just select it from the dropdown menu and create the new image

![create a new image](https://i.imgur.com/DerRWeZ.png)

### Create the initialization script

> This step must be done only once

An initialization script allows you execute some code upon creating a new image.
It is especially useful if a previous image of yours somehow encountered
problems and you want to start anew. The script given below clones this repo,
adds it Iceberg and loads the necessary packages. It does the same with Roassal.

1. Click on the `+` icon to create a new script and give it a name, e.g. `papermosaik`
2. Paste the following code in the right panel:
```st
"Add credentials to be able to clone PaperMosaik"
Iceberg enableMetacelloIntegration: true.
Iceberg remoteTypeSelector: #httpsUrl.
IceCredentialStore current
    storeCredential: (IcePlaintextCredentials new
        username: 'GITLAB_USERNAME';
        password: 'GITLAB_API_TOKEN';
        host: 'gitlab.reveal.si.usi.ch';
        yourself).

"Install PaperMosaik and dependencies"
Metacello new
    baseline: 'PaperMosaik';
    repository: 'gitlab://gitlab.reveal.si.usi.ch:teaching/sde-atelier-design-101/d101-projects/2023/papermosaik:main';
    load.
```
3. Change the `GITLAB_USERNAME` into your username
4. Change the `GITLAB_API_TOKEN` into the personal access token you created in
   the very first step
5. Save the script

![create the initialization script](https://i.imgur.com/ksjv7Il.png)

### Create the new image with the script

Now you can simply select the script you just created from the dropdown menu and
create the new image. 

