#How to create the HCP account
./https://portal.cloud.hashicorp.com/sign-in
## HCP Vault with Terraform

### Create a HCP Account

- https://portal.cloud.hashicorp.com/sign-in
- Login : helloocloud+hashicorp@gmail.com

### HCP Org is `hellocloud-hcp-org`

![Screenshot 2024-01-27 at 1.00.39 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0176c092-837b-49b4-8faa-5ca016710f34/03c776fb-460e-4d82-9658-b1029ecfe6e5/Screenshot_2024-01-27_at_1.00.39_PM.png)

![Screenshot 2024-01-27 at 1.02.16 PM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0176c092-837b-49b4-8faa-5ca016710f34/a5dd403a-5044-4453-9eb5-3e8c58139b3f/Screenshot_2024-01-27_at_1.02.16_PM.png)

### Create IAM Service Principals in HCP ORG

![Screenshot 2024-01-27 at 9.40.26 AM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0176c092-837b-49b4-8faa-5ca016710f34/ac60f8fb-0ff7-4703-a741-9ee6f790cbcf/Screenshot_2024-01-27_at_9.40.26_AM.png)

![Screenshot 2024-01-27 at 9.41.11 AM.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/0176c092-837b-49b4-8faa-5ca016710f34/565018af-a89f-4e67-8442-d34197dd05dd/Screenshot_2024-01-27_at_9.41.11_AM.png)

### Service Principal Name - `hellocloud-hcp-org-sp`

### Note

After creating Service Principal key, create the followings:

- `Client ID` - `xxxx`
- `Client Secret` - `xxxx`

Export them as environment variables.

```jsx
export HCP_CLIENT_ID=xxxx
export HCP_CLIENT_SECRET=xxxx
```

Optionally, you can store them in HCP Vault Secrets

### Optional - Using HCP Vault Secrets CLI

- Install for Mac

```jsx
brew tap hashicorp/tap
brew install vlt
```

- Install for Linux

```jsx
sudo apt update
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vlt -y
```

- Run `vlt login` - This will fail if you don’t create Service Principal.

```jsx
$ vlt config init
✔ Organization with name hellocloud-hcp-org ID f1210322-72b4-4a50-9ae0-2ce66fa3e13b selected
✔ Project with name default-project ID 89ac14f5-a4a1-40ff-81ed-2845b80236e1 selected
✔ Application with name hellocloud-hcp-org selected
```

- Retrieve Secrets from HCP Vault Secrets

```jsx
$ vlt secrets list
Name                                 Latest Version  Created At                
hellocloud_hcp_org_sp_Client_ID      1               2024-01-27T05:29:19.261Z  
hellocloud_hcp_org_sp_Client_Secret  1               2024-01-27T05:30:00.170Z

$ vlt secrets get --plaintext hellocloud_hcp_org_sp_Client_ID
xxxxxxx

$ vlt secrets get --plaintext hellocloud_hcp_org_sp_Client_Secret
xxxxxxx
```

- Login / Logout

```jsx
vlt logout
vlt login
```

### export `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET`

```jsx
export HCP_CLIENT_ID=<client id value previously copied>
export HCP_CLIENT_SECRET=<client secret value previously copied>
```
