# Installing Vault
## For Ubuntu [Page](https://developer.hashicorp.com/vault/install)

```
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update && sudo apt install vault
```

## Starting the Vault Dev Server
```
vault server -dev
```
- runs entirely in-memory
* starts unsealed with a single unseal key
+ The root token is already authenticated to the CLI
+ test

```
WARNING! dev mode is enabled! In this mode, Vault runs entirely in-memory
and starts unsealed with a single unseal key. The root token is already
authenticated to the CLI, so you can immediately begin using Vault.

You may need to set the following environment variables:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: uW4AYwyjU0c08SqFZ4+vVNV3kP9GSTDej2ZZk/+HJq8=
Root Token: hvs.kwGpXDbFUUqBFiVzq2C56qzr

Development mode should NOT be used in production installations!
```
