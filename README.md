# PaperMosaik

## Setup

### Before Creating a New Image

> This step should be performed only once.

Before cloning this repository, you must first create a **GitLab access token**.

To do so:

1. Click on your profile picture in the top-left corner of the screen, then select `Preferences`.
2. Select `Access Tokens` in the sidebar.
3. Click on the `Add new token` button.
4. Give the token a name, for example, `Pharo PaperMosaik`.
5. Set a reasonable expiration date, such as `2023-12-31`.
6. Check the `read_api` checkbox.
7. Check the `read_repository` checkbox.
8. Check the `write_repository` checkbox.
9. Click on the `Create personal access token`.

![Access Token Creation](https://i.imgur.com/kZxck13.png)
![Access Token Permissions](https://i.imgur.com/xTQBH9F.png)

### Creating the New Image

To set up a new Pharo 10 image with the code from the main branch, please follow these steps:

1. Click on the `New` icon at the top-left of the Pharo launcher.
2. Select the `Official distributions` template category.
3. Choose the `Pharo 10.0 - 64bit (old stable)` template.
4. Provide a name for the image, for instance, `PaperMosaik`.
5. Click on the pen icon.

**NOTE**: If you have already created the init script, you can simply select it from the dropdown menu to create the new image.

![Create a New Image](https://i.imgur.com/DerRWeZ.png)

### Creating the Initialization Script

> This step should be performed only once.

An initialization script allows you to execute code when creating a new image. It's especially useful if a previous image encountered problems and you want to start fresh. The script provided below clones this repository, adds it to Iceberg, and loads the necessary packages. It does the same with Roassal.

1. Click on the `+` icon to create a new script and give it a name, e.g., `papermosaik`.
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

"Install PaperMosaik and its dependencies"
Metacello new
    baseline: 'PaperMosaik';
    repository: 'gitlab://gitlab.reveal.si.usi.ch:teaching/sde-atelier-design-101/d101-projects/2023/papermosaik:main';
    load.
Metacello new
	repository: 'github://svenvc/NeoJSON/repository';
	baseline: 'NeoJSON';
	load
```

3. Replace `GITLAB_USERNAME` with your username.
4. Replace `GITLAB_API_TOKEN` with the personal access token you created in the initial step.
5. Save the script.

![Create the Initialization Script](https://i.imgur.com/ksjv7Il.png)

### Create the New Image with the Script

Now, you can simply select the script you just created from the dropdown menu and create the new image.
