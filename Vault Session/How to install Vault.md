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
```
waiphyokyaw@system76-pc:~$ vault server -dev
==> Vault server configuration:

Administrative Namespace: 
             Api Address: http://127.0.0.1:8200
                     Cgo: disabled
         Cluster Address: https://127.0.0.1:8201
   Environment Variables: COLORTERM, DBUS_SESSION_BUS_ADDRESS, DESKTOP_SESSION, DISPLAY, GDMSESSION, GIO_LAUNCHED_DESKTOP_FILE_PID, GNOME_DESKTOP_SESSION_ID, GNOME_SHELL_SESSION_MODE, GODEBUG, GPG_AGENT_INFO, GTK_IM_MODULE, GTK_MODULES, HOME, IBUS_DISABLE_SNOOPER, IM_CONFIG_PHASE, INVOCATION_ID, JOURNAL_STREAM, LANG, LANGUAGE, LC_ADDRESS, LC_IDENTIFICATION, LC_MEASUREMENT, LC_MONETARY, LC_NAME, LC_NUMERIC, LC_PAPER, LC_TELEPHONE, LC_TIME, LESSCLOSE, LESSOPEN, LOGNAME, LS_COLORS, MANAGERPID, PAPERSIZE, PATH, PWD, QT_ACCESSIBILITY, QT_IM_MODULE, SESSION_MANAGER, SHELL, SHLVL, SSH_AGENT_LAUNCHER, SSH_AUTH_SOCK, SYSTEMD_EXEC_PID, TERM, TERMINATOR_DBUS_NAME, TERMINATOR_DBUS_PATH, TERMINATOR_UUID, USER, USERNAME, VTE_VERSION, WINDOWPATH, XAUTHORITY, XDG_CONFIG_DIRS, XDG_CURRENT_DESKTOP, XDG_DATA_DIRS, XDG_MENU_PREFIX, XDG_RUNTIME_DIR, XDG_SESSION_CLASS, XDG_SESSION_DESKTOP, XDG_SESSION_TYPE, XMODIFIERS, _
              Go Version: go1.21.4
              Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
               Log Level: 
                   Mlock: supported: true, enabled: false
           Recovery Mode: false
                 Storage: inmem
                 Version: Vault v1.15.4, built 2023-12-04T17:45:28Z
             Version Sha: 9b61934559ba31150860e618cf18e816cbddc630

==> Vault server started! Log data will stream in below:

2024-01-01T16:55:13.392+0300 [INFO]  proxy environment: http_proxy="" https_proxy="" no_proxy=""
2024-01-01T16:55:13.392+0300 [INFO]  incrementing seal generation: generation=1
2024-01-01T16:55:13.392+0300 [WARN]  no `api_addr` value specified in config or in VAULT_API_ADDR; falling back to detection if possible, but this value should be manually set
2024-01-01T16:55:13.393+0300 [INFO]  core: Initializing version history cache for core
2024-01-01T16:55:13.393+0300 [INFO]  events: Starting event system
2024-01-01T16:55:13.394+0300 [INFO]  core: security barrier not initialized
2024-01-01T16:55:13.394+0300 [INFO]  core: security barrier initialized: stored=1 shares=1 threshold=1
2024-01-01T16:55:13.395+0300 [INFO]  core: post-unseal setup starting
2024-01-01T16:55:13.400+0300 [INFO]  core: loaded wrapping token key
2024-01-01T16:55:13.400+0300 [INFO]  core: successfully setup plugin runtime catalog
2024-01-01T16:55:13.400+0300 [INFO]  core: successfully setup plugin catalog: plugin-directory=""
2024-01-01T16:55:13.401+0300 [INFO]  core: no mounts; adding default mount table
2024-01-01T16:55:13.403+0300 [INFO]  core: successfully mounted: type=cubbyhole version="v1.15.4+builtin.vault" path=cubbyhole/ namespace="ID: root. Path: "
2024-01-01T16:55:13.403+0300 [INFO]  core: successfully mounted: type=system version="v1.15.4+builtin.vault" path=sys/ namespace="ID: root. Path: "
2024-01-01T16:55:13.404+0300 [INFO]  core: successfully mounted: type=identity version="v1.15.4+builtin.vault" path=identity/ namespace="ID: root. Path: "
2024-01-01T16:55:13.405+0300 [INFO]  core: successfully mounted: type=token version="v1.15.4+builtin.vault" path=token/ namespace="ID: root. Path: "
2024-01-01T16:55:13.405+0300 [INFO]  rollback: Starting the rollback manager with 256 workers
2024-01-01T16:55:13.406+0300 [INFO]  rollback: starting rollback manager
2024-01-01T16:55:13.406+0300 [INFO]  core: restoring leases
2024-01-01T16:55:13.406+0300 [INFO]  expiration: lease restore complete
2024-01-01T16:55:13.406+0300 [INFO]  identity: entities restored
2024-01-01T16:55:13.406+0300 [INFO]  identity: groups restored
2024-01-01T16:55:13.406+0300 [INFO]  core: Recorded vault version: vault version=1.15.4 upgrade time="2024-01-01 13:55:13.40692795 +0000 UTC" build date=2023-12-04T17:45:28Z
2024-01-01T16:55:13.595+0300 [INFO]  core: post-unseal setup complete
2024-01-01T16:55:13.596+0300 [INFO]  core: root token generated
2024-01-01T16:55:13.596+0300 [INFO]  core: pre-seal teardown starting
2024-01-01T16:55:13.596+0300 [INFO]  rollback: stopping rollback manager
2024-01-01T16:55:13.596+0300 [INFO]  core: pre-seal teardown complete
2024-01-01T16:55:13.596+0300 [INFO]  core.cluster-listener.tcp: starting listener: listener_address=127.0.0.1:8201
2024-01-01T16:55:13.596+0300 [INFO]  core.cluster-listener: serving cluster requests: cluster_listen_address=127.0.0.1:8201
2024-01-01T16:55:13.597+0300 [INFO]  core: post-unseal setup starting
2024-01-01T16:55:13.597+0300 [INFO]  core: loaded wrapping token key
2024-01-01T16:55:13.597+0300 [INFO]  core: successfully setup plugin runtime catalog
2024-01-01T16:55:13.597+0300 [INFO]  core: successfully setup plugin catalog: plugin-directory=""
2024-01-01T16:55:13.597+0300 [INFO]  core: successfully mounted: type=system version="v1.15.4+builtin.vault" path=sys/ namespace="ID: root. Path: "
2024-01-01T16:55:13.598+0300 [INFO]  core: successfully mounted: type=identity version="v1.15.4+builtin.vault" path=identity/ namespace="ID: root. Path: "
2024-01-01T16:55:13.598+0300 [INFO]  core: successfully mounted: type=cubbyhole version="v1.15.4+builtin.vault" path=cubbyhole/ namespace="ID: root. Path: "
2024-01-01T16:55:13.598+0300 [INFO]  core: successfully mounted: type=token version="v1.15.4+builtin.vault" path=token/ namespace="ID: root. Path: "
2024-01-01T16:55:13.598+0300 [INFO]  rollback: Starting the rollback manager with 256 workers
2024-01-01T16:55:13.599+0300 [INFO]  rollback: starting rollback manager
2024-01-01T16:55:13.599+0300 [INFO]  core: restoring leases
2024-01-01T16:55:13.599+0300 [INFO]  identity: entities restored
2024-01-01T16:55:13.599+0300 [INFO]  identity: groups restored
2024-01-01T16:55:13.599+0300 [INFO]  expiration: lease restore complete
2024-01-01T16:55:13.599+0300 [INFO]  core: post-unseal setup complete
2024-01-01T16:55:13.599+0300 [INFO]  core: vault is unsealed
2024-01-01T16:55:13.601+0300 [INFO]  core: successful mount: namespace="" path=secret/ type=kv version=""
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
^C==> Vault shutdown triggered
2024-01-01T16:55:31.192+0300 [INFO]  core: marked as sealed
2024-01-01T16:55:31.192+0300 [INFO]  core: pre-seal teardown starting
2024-01-01T16:55:31.192+0300 [INFO]  rollback: stopping rollback manager
2024-01-01T16:55:31.192+0300 [INFO]  core: pre-seal teardown complete
2024-01-01T16:55:31.192+0300 [INFO]  core: stopping cluster listeners
2024-01-01T16:55:31.192+0300 [INFO]  core.cluster-listener: forwarding rpc listeners stopped
2024-01-01T16:55:31.621+0300 [INFO]  core.cluster-listener: rpc listeners successfully shut down
2024-01-01T16:55:31.621+0300 [INFO]  core: cluster listeners successfully shut down
2024-01-01T16:55:31.622+0300 [INFO]  core: vault is sealed
```
```
If your vault is running on vagrant,
vault server -dev -dev-listen-address="0.0.0.0:8200"
```
* Set environment variable
  ```
  waiphyokyaw@system76-pc:~$ export VAULT_ADDR='http://127.0.0.1:8200'
  ```
* Run vault status to verify
  ```
  waiphyokyaw@system76-pc:~$ vault status
Key             Value
---             -----
Seal Type       shamir
Initialized     true
Sealed          false
Total Shares    1
Threshold       1
Version         1.15.4
Build Date      2023-12-04T17:45:28Z
Storage Type    inmem
Cluster Name    vault-cluster-2e82de80
Cluster ID      27375a20-5f8b-c82a-7939-d97133f9e6f6
HA Enabled      false
```
