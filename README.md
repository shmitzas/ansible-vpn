# ansible-vpn
This repo is used to automate secure WG-Easy + Traefik reverse proxy VPN endpoint creation

## Python environment setup (Windows)

### Ansible works properly only for LINUX!

1. Ensure `Python 3.11 and Pip3` are installed
2. Launch terminal
3. Launch setup script
    ```bash
    . setup.sh
    ```
    
    or

    ```bash
    source setup.sh
    ```
   
### After modifying `setup.sh` run this command to remove Windows-like symbols which blocks the script from executing properly

```bash
sed -i 's/\r$//' setup.sh
```

## New VPN endpoint bootstrap procedure

1. Add your new endpoint root password (if enabled and SSH key not present yet) to `inventory/group_vars/all.yml`
2. Add your SSH Public key to `inventory/files/key.pub`
3. Ensure there is a DNS record created for the same domain as the new endpoint hostname (eg. `lt.tunelis online`)
4. Ensure there is a sub-domain record created for traefik (eg. `traefik.lt.tunelis.online`)
5. Run one of these commands to setup new VPN endpoint

- Fully automated SSH Hardening, UFW, Traefik reverse proxy, WG-Easy setup
    ```bash
    ansible-playbook -i inventory/hosts site.yml
    ```

- Limit FULL setup only for specific host
    ```bash
    ansible-playbook -i inventory/hosts site.yml -l vps.example.com
    ```
