## make sure password less sudo is setup on servers

```
sudo sh -c 'echo "tim ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/tim'
```

## install log2ram package to all vms

```
ansible-playbook -i servers.ini optimise-servers.yml
```