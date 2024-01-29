```jsx
terraform plan -var-file tf-hcp-credentials.tfvars
```

- Find the HCP Vaulet Provider ([Page](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster))
- Before creating the HCP Vault cluster, we must add the HashiCorp Virtual Networks (HVN) code into our Terraform code
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
## Create HVN step

- Sample code reference ([Page](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn))
- The following are default CIDR block values to be aware of: HCP HVN (172.25.16.0/20), AWS VPC (172.31.0.0/16), and Azure VNet (172.29.0.0/24).

```jsx
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tf-hcp-vault$ terraform init

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/hcp versions matching "0.81.0"...
- Installing hashicorp/hcp v0.81.0...
- Installed hashicorp/hcp v0.81.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tf-hcp-vault$ terraform plan -var-file tf-hcp-credentials.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated
with the following symbols:
  + create

Terraform will perform the following actions:

  # hcp_hvn.aws_hcp_vault_hvn will be created
  + resource "hcp_hvn" "aws_hcp_vault_hvn" {
      + cidr_block          = (known after apply)
      + cloud_provider      = "aws"
      + created_at          = (known after apply)
      + hvn_id              = "aws-hcp-vault-hvn"
      + id                  = (known after apply)
      + organization_id     = (known after apply)
      + project_id          = (known after apply)
      + provider_account_id = (known after apply)
      + region              = "ap-southeast-1"
      + self_link           = (known after apply)
      + state               = (known after apply)
    }

  # hcp_vault_cluster.aws_hcp_vault_cluster will be created
  + resource "hcp_vault_cluster" "aws_hcp_vault_cluster" {
      + cloud_provider             = (known after apply)
      + cluster_id                 = "aws-hcp-vault-cluster"
      + created_at                 = (known after apply)
      + hvn_id                     = "aws-hcp-vault-hvn"
      + id                         = (known after apply)
      + namespace                  = (known after apply)
      + organization_id            = (known after apply)
      + project_id                 = (known after apply)
      + proxy_endpoint             = "DISABLED"
      + public_endpoint            = true
      + region                     = (known after apply)
      + self_link                  = (known after apply)
      + state                      = (known after apply)
      + tier                       = "dev"
      + vault_private_endpoint_url = (known after apply)
      + vault_proxy_endpoint_url   = (known after apply)
      + vault_public_endpoint_url  = (known after apply)
      + vault_version              = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions
if you run "terraform apply" now.

vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tf-hcp-vault$ terraform apply -var-file tf-hcp-credentials.tfvars

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # hcp_hvn.aws_hcp_vault_hvn will be created
  + resource "hcp_hvn" "aws_hcp_vault_hvn" {
      + cidr_block          = (known after apply)
      + cloud_provider      = "aws"
      + created_at          = (known after apply)
      + hvn_id              = "aws-hcp-vault-hvn"
      + id                  = (known after apply)
      + organization_id     = (known after apply)
      + project_id          = (known after apply)
      + provider_account_id = (known after apply)
      + region              = "ap-southeast-1"
      + self_link           = (known after apply)
      + state               = (known after apply)
    }

  # hcp_vault_cluster.aws_hcp_vault_cluster will be created
  + resource "hcp_vault_cluster" "aws_hcp_vault_cluster" {
      + cloud_provider             = (known after apply)
      + cluster_id                 = "aws-hcp-vault-cluster"
      + created_at                 = (known after apply)
      + hvn_id                     = "aws-hcp-vault-hvn"
      + id                         = (known after apply)
      + namespace                  = (known after apply)
      + organization_id            = (known after apply)
      + project_id                 = (known after apply)
      + proxy_endpoint             = "DISABLED"
      + public_endpoint            = true
      + region                     = (known after apply)
      + self_link                  = (known after apply)
      + state                      = (known after apply)
      + tier                       = "dev"
      + vault_private_endpoint_url = (known after apply)
      + vault_proxy_endpoint_url   = (known after apply)
      + vault_public_endpoint_url  = (known after apply)
      + vault_version              = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

hcp_hvn.aws_hcp_vault_hvn: Creating...
hcp_hvn.aws_hcp_vault_hvn: Still creating... [10s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [20s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [30s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [40s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [50s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [1m0s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still creating... [1m10s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Creation complete after 1m20s [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.network.hvn/aws-hcp-vault-hvn]
hcp_vault_cluster.aws_hcp_vault_cluster: Creating...
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [1m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [2m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [3m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [4m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [5m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still creating... [6m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Creation complete after 6m4s [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.vault.cluster/aws-hcp-vault-cluster]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## Login using the public IP to access the Vault cluster.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/14b32049-282b-4ce2-a6d1-9885ac2e90c2/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/85e21dfe-a3ee-4072-91c2-4b0e1a354fcb/Untitled.png)

- Click public

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/305c8aca-4ab4-4271-b753-cb873f98890f/Untitled.png)

- Then paste to browser

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/07a6c503-18e7-4952-9835-40a7841eb0a4/Untitled.png)

- Generate a token and paste it above

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/858fe138-d02d-40d0-82ea-3ddfecabda27/Untitled.png)

- Now you can access the Vault cluster.

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/99aabb51-e551-4305-9b66-00f4356e2689/Untitled.png)

### How to access via cli

- Generate cli

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/df24817c-0df9-472e-bd5c-bff047cc3616/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/36e83e18-1ce7-46ed-801c-359a1e7a9eef/Untitled.png)

![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/340dcba1-3ba5-431f-95f4-f5fe30747777/a3fea3cf-27d7-4af0-8e88-a1754b8defa3/Untitled.png)

```jsx
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault$ export VAULT_ADDR="https://aws-hcp-vault-cluster-public-vault-253b0a34.1758da0f.z1.hashicorp.cloud:8200"; export VAULT_NAMESPACE="admin"
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault$ export VAULT_TOKEN=hvs.CAESIGeun3eDpLR_paNPOalyNLEKH0p1F2JFr3aVgeyxdlotGicKImh2cy5icHlRR2xEclh3ZG1IcGN5MXhBWEVpbmIuTU5vQnoQggI
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault$ vault status
Key                      Value
---                      -----
Seal Type                awskms
Recovery Seal Type       shamir
Initialized              true
Sealed                   false
Total Recovery Shares    1
Threshold                1
Version                  1.15.4+ent
Build Date               2023-12-05T01:50:21Z
Storage Type             raft
Cluster Name             vault-cluster-6844ed83
Cluster ID               bafad70b-108d-4ff4-2b9d-2a1cc3236713
HA Enabled               true
HA Cluster               https://172.25.18.71:8201
HA Mode                  active
Active Since             2024-01-29T11:22:16.403946548Z
Raft Committed Index     1296
Raft Applied Index       1296
Last WAL                 332
```

```jsx
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tf-hcp-vault$ terraform destroy
var.client_id
  This is hcp client-id

  Enter a value: ^C

Interrupt received.
Please wait for Terraform to exit or data loss may occur.
Gracefully shutting down...

╷
│ Error: No value for required variable
│ 
│   on variables.tf line 30:
│   30: variable "client_id" {
│ 
│ The root module input variable "client_id" is not set, and has no default value. Use a -var or -var-file command line argument to provide a value for this variable.
╵
╷
│ Error: No value for required variable
│ 
│   on variables.tf line 34:
│   34: variable "client_secret" {
│ 
│ The root module input variable "client_secret" is not set, and has no default value. Use a -var or -var-file command line argument to provide a value for this variable.
╵
vagrant@HelloCloudDevBox:~/Hashicorp-cp/Vault/tf-hcp-vault$ terraform destroy --var-file tf-hcp-credentials.tfvars 
hcp_hvn.aws_hcp_vault_hvn: Refreshing state... [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.network.hvn/aws-hcp-vault-hvn]
hcp_vault_cluster.aws_hcp_vault_cluster: Refreshing state... [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.vault.cluster/aws-hcp-vault-cluster]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # hcp_hvn.aws_hcp_vault_hvn will be destroyed
  - resource "hcp_hvn" "aws_hcp_vault_hvn" {
      - cidr_block          = "172.25.16.0/20" -> null
      - cloud_provider      = "aws" -> null
      - created_at          = "2024-01-29T11:15:14.000Z" -> null
      - hvn_id              = "aws-hcp-vault-hvn" -> null
      - id                  = "/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.network.hvn/aws-hcp-vault-hvn" -> null
      - organization_id     = "0855ae3e-c27a-4c16-9169-87ae18e9c503" -> null
      - project_id          = "6227cc79-be44-4e83-ac28-4d022de1af9e" -> null
      - provider_account_id = "712771881795" -> null
      - region              = "ap-southeast-1" -> null
      - self_link           = "/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.network.hvn/aws-hcp-vault-hvn" -> null
      - state               = "STABLE" -> null
    }

  # hcp_vault_cluster.aws_hcp_vault_cluster will be destroyed
  - resource "hcp_vault_cluster" "aws_hcp_vault_cluster" {
      - cloud_provider             = "aws" -> null
      - cluster_id                 = "aws-hcp-vault-cluster" -> null
      - created_at                 = "2024-01-29T11:16:34.035Z" -> null
      - hvn_id                     = "aws-hcp-vault-hvn" -> null
      - id                         = "/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.vault.cluster/aws-hcp-vault-cluster" -> null
      - namespace                  = "admin" -> null
      - organization_id            = "0855ae3e-c27a-4c16-9169-87ae18e9c503" -> null
      - project_id                 = "6227cc79-be44-4e83-ac28-4d022de1af9e" -> null
      - proxy_endpoint             = "DISABLED" -> null
      - public_endpoint            = true -> null
      - region                     = "ap-southeast-1" -> null
      - self_link                  = "/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.vault.cluster/aws-hcp-vault-cluster" -> null
      - state                      = "RUNNING" -> null
      - tier                       = "DEV" -> null
      - vault_private_endpoint_url = "https://aws-hcp-vault-cluster-private-vault-253b0a34.1758da0f.z1.hashicorp.cloud:8200" -> null
      - vault_public_endpoint_url  = "https://aws-hcp-vault-cluster-public-vault-253b0a34.1758da0f.z1.hashicorp.cloud:8200" -> null
      - vault_version              = "v1.15.4" -> null

      - major_version_upgrade_config {
          - upgrade_type = "AUTOMATIC" -> null
        }
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

hcp_vault_cluster.aws_hcp_vault_cluster: Destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.vault.cluster/aws-hcp-vault-cluster]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 1m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 2m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 3m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 4m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 5m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 6m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 7m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m30s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m40s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 8m50s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 9m0s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 9m10s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...rp.vault.cluster/aws-hcp-vault-cluster, 9m20s elapsed]
hcp_vault_cluster.aws_hcp_vault_cluster: Destruction complete after 9m22s
hcp_hvn.aws_hcp_vault_hvn: Destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022de1af9e/hashicorp.network.hvn/aws-hcp-vault-hvn]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 10s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 20s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 30s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 40s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 50s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 1m0s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Still destroying... [id=/project/6227cc79-be44-4e83-ac28-4d022d...ashicorp.network.hvn/aws-hcp-vault-hvn, 1m10s elapsed]
hcp_hvn.aws_hcp_vault_hvn: Destruction complete after 1m12s

Destroy complete! Resources: 2 destroyed.
```

### Reference

[Terraform Registry](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/hvn)

[Terraform Registry](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_cluster)
