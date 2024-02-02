# Architecture
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/8a51c12a-1be6-410e-895c-bf4eaa49d118)
## Create Free Terraform Cloud Account ([Page](https://app.terraform.io/app))
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/0d90695b-89d7-4df3-9a16-07d5b9b2077d)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/b2f02308-b0a3-4b23-ad1e-6a37ad5ad94d)

## Generate a Terraform Cloud user token and connect to TFC Cloud
```jsx
vagrant@HelloCloudDevBox:~$ terraform login
Terraform will request an API token for app.terraform.io using your browser.

If login is successful, Terraform will store the token in plain text in
the following file for use by subsequent commands:
    /home/vagrant/.terraform.d/credentials.tfrc.json

Do you want to proceed?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

---------------------------------------------------------------------------------

Open the following URL to access the tokens page for app.terraform.io:
    https://app.terraform.io/app/settings/tokens?source=terraform-login

---------------------------------------------------------------------------------

Generate a token using your browser, and copy-paste it into this prompt.

Terraform will store the token in plain text in the following file
for use by subsequent commands:
    /home/vagrant/.terraform.d/credentials.tfrc.json

Token for app.terraform.io:
  Enter a value:
```

- Browse  https://app.terraform.io/app/settings/tokens?source=terraform-login

![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/ffdc1336-bd39-45f0-baf0-c628afa87d3e)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/d5e13634-9de6-4a44-b11e-d6bf812c1c3d)

- Create the tfc user token and paste it.

```jsx
vagrant@HelloCloudDevBox:~$ terraform login
Terraform will request an API token for app.terraform.io using your browser.

If login is successful, Terraform will store the token in plain text in
the following file for use by subsequent commands:
    /home/vagrant/.terraform.d/credentials.tfrc.json

Do you want to proceed?
  Only 'yes' will be accepted to confirm.

  Enter a value: yes

---------------------------------------------------------------------------------

Open the following URL to access the tokens page for app.terraform.io:
    https://app.terraform.io/app/settings/tokens?source=terraform-login

---------------------------------------------------------------------------------

Generate a token using your browser, and copy-paste it into this prompt.

Terraform will store the token in plain text in the following file
for use by subsequent commands:
    /home/vagrant/.terraform.d/credentials.tfrc.json

Token for app.terraform.io:
  Enter a value: 

Retrieved token for user Terraform_Cop

---------------------------------------------------------------------------------

                                          -                                
                                          -----                           -
                                          ---------                      --
                                          ---------  -                -----
                                           ---------  ------        -------
                                             -------  ---------  ----------
                                                ----  ---------- ----------
                                                  --  ---------- ----------
   Welcome to Terraform Cloud!                     -  ---------- -------
                                                      ---  ----- ---
   Documentation: terraform.io/docs/cloud             --------   -
                                                      ----------
                                                      ----------
                                                       ---------
                                                           -----
                                                               -

   New to TFC? Follow these steps to instantly apply an example configuration:

   $ git clone https://github.com/hashicorp/tfc-getting-started.git
   $ cd tfc-getting-started
   $ scripts/setup.sh

vagrant@HelloCloudDevBox:~$
```
## Generate a Personal Access Token and connect to GitHub
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/34c5fc21-4cd7-4b16-8d13-2a90f9be6dd0)

![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/c182ec9b-7177-434c-8ba7-dc5fd537e5a5)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/a51f4ae0-9409-49b7-b3d2-1a39d3f0412a)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/64f3e90c-c0ed-40c5-988b-41a349931635)
- Create the token ( choose the scopes of token )
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/61b846e8-c989-418d-ad0d-4a6c7bd48de5)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/7f8cafe0-9669-4172-854b-835ed79d0f09)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/62bf4166-98f5-4a84-a4b7-a5ea58fde74d)

```jsx
vagrant@HelloCloudDevBox:~$ gh auth login --with-token <<< ghp_xxxxxxxxxxxxxxx
vagrant@HelloCloudDevBox:~$ gh auth status
github.com
  ✓ Logged in to github.com account cloudgitcollab (/home/vagrant/.config/gh/hosts.yml)
  - Active account: true
  - Git operations protocol: https
  - Token: ghp_************************************
  - Token scopes: 'delete_repo', 'read:org', 'repo', 'user', 'workflow'
```

## [Github Client installation on Linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

```jsx
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

```jsx
vagrant@HelloCloudDevBox:~$  git version
git version 2.34.1
```

## Create the tfc Organization

- Before connecting, it is necessary to create the organization in our Terraform Cloud.
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/9978ef86-f10e-4904-979f-ba0fd07f18f3)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/f2841f94-d31d-4d9f-bad0-fa01a84beadc)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/8a226911-05e2-44f3-bd3f-bb5dbc7ba5d2)
## Connect the organization-level TFC Cloud VCS provider and GitHub OAuth
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/65e65b18-1f9c-407e-8887-579456e13037)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/e1692e3b-a7fe-4f93-a0c3-0f5670843162)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/f84472b7-d073-4d58-9dcc-507eaca12a64)

- Go Github`Settings` >> `Developer Settings` >> `OAuth Apps`
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/bf08f157-d79b-4c75-b258-e0dcce0c42bb)
- And afterward, copy the `Application name`, `Homepage URL`, and `Authorization callback URL` from Terraform Cloud, then paste them into GitHub OAuth.
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/89248025-6cf1-4b24-ae68-57029b715c99)
- In a similar fashion, copy the `Client ID` and `Client Secret` from GitHub and paste them into Terraform Cloud vcs provider
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/b32da806-020a-40ce-9298-42e63f00bdb5)
- Finally, the connection is established
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/e0d10795-9b8d-45b8-9463-27d14c88e163)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/bab2ae47-ee7b-4f7e-b16d-05c99b5e4a6f)
![image](https://github.com/WaiKyaw-Cloud/Terraform/assets/157877132/5a9ee8d8-05b9-4dfc-bde9-5350019b53ad)

## Create Workspaces ( Version Control Workflow )
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/d0f4f2c9-e2c2-402f-acea-da3dc089abc4)
- Choose `Version Control Workflow`
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/3a549175-6fc2-4cbf-9683-88b3a0839601)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/d096e233-1ffc-40a4-a94d-64c64c773653)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/3df8d408-d295-433e-92c9-2413a005638c)

## Create the repository and push the code to GitHub

```jsx
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        main.tf
        outputs.tf
        variables.tf
        versions.tf

nothing added to commit but untracked files present (use "git add" to track)
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git add .
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git commit -m " file upload "
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git remote -v
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git config user.name "cloudgitcollab"
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ git config user.email "william.phyokyaw@gmail.com"
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tfc-vcs-github-hcp-vault$ gh repo create tfc-vcs-github-hcp-vault --private --source=. --remote=upstream --push
✓ Created repository cloudgitcollab/tfc-vcs-github-hcp-vault on GitHub
✓ Added remote https://github.com/cloudgitcollab/tfc-vcs-github-hcp-vault.git
Enumerating objects: 6, done.
Counting objects: 100% (6/6), done.
Delta compression using up to 4 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (6/6), 786 bytes | 393.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/cloudgitcollab/tfc-vcs-github-hcp-vault.git
 * [new branch]      HEAD -> master
Branch 'master' set up to track remote branch 'master' from 'upstream'.
✓ Pushed commits to https://github.com/cloudgitcollab/tfc-vcs-github-hcp-vault.git
```
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/c752c0ad-366d-4013-a0c8-61a687163f55)
## Choose the repository at the TFC workspace
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/a68ced64-c5de-4614-ab4a-dcb4ffca7108)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/87b4473a-c197-452b-9179-2916ca233623)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/ce69a39e-127a-4085-8ba9-a2d0f81a4be2)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/26c12222-6f0a-4d8e-a3b1-1f93d0a52ca7)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/bc36236a-754f-4d85-a3e3-60cbf00de352)

## Create New project and Service Principles ( **`Client ID` and `Client secret` )**
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/ee49ea16-d9d1-4c3f-96d1-af120a7cc9b5)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/b264cd87-bb4f-4026-baca-846fc875850e)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/f2a02a54-1e31-4b72-b1ed-434f2b6695d5)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/d5d8edd5-bea9-46cf-9a18-9d647e51805e)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/d9ce9a42-507a-4a87-842d-5b24b8dd1aee)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/683c61ca-17b4-457f-88ad-a98e38af136a)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/d1cc2d29-3d24-4e4f-ac14-bd3d59de3ebe)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/93f9d195-9bfb-4502-ba92-a8561db8a496)
- Save the client ID and secret as the environment variables HCP_CLIENT_ID and HCP_CLIENT_SECRET.

```jsx
// Credentials can be set explicitly or via the environment variables HCP_CLIENT_ID and HCP_CLIENT_SECRET
provider "hcp" {
  client_id     = "service-principal-key-client-id"
  client_secret = "service-principal-key-client-secret"
}
```

- Or, configure the provider with the client ID and secret by copy-pasting the values directly into provider config.

```jsx
HCP_CLIENT_ID="..."
HCP_CLIENT_SECRET="..."
```

<aside>
💡 **Warning:** Hard-coded credentials are not recommended in Terraform configuration outside of local testing and risks secret exposure if committed to a code repository.

</aside>

## Add **`Client ID` and `Client secret`** to TFC workspaces as environment variables
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/5a2e47a9-ce05-4861-acb9-334339939ace)
- **`Sensitive variables` ::** variables are never shown in the UI or API, and can’t be edited. They may appear in Terraform logs if your configuration is designed to output them. To change a sensitive variable, delete and replace it.
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/6099fee6-7568-4203-b038-8cda89055bcd)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/3750d809-e1c6-4389-b493-452ff1079a31)

## Initiate a new run at TFC workspaces
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/966c68e5-96de-4286-8dd9-5112995c2a1f)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/19793644-7805-47bd-8c7d-7fcdd8baffba)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/e5ccdb21-f107-4327-a454-eeac8c078d73)

- Check the status of resource creation in HCP.
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/9d55b0d2-e1cf-46b2-97e6-d5eb3ea5a368)

- It has been created successfully. Let's check the status of the Vault Cluster
    - Generate publin URL and token.
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/dee4fcbb-014e-42f4-98d5-347280d18947)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/0d8a8c72-6315-49f8-9d7d-534bb55c013e)
![image](https://github.com/WaiKyaw-Cloud/Vault/assets/157877132/777f6e99-f919-4e4d-ac6d-c8c8e60a171d)




















