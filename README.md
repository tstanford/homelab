## make sure password less sudo is setup on servers

```
sudo sh -c 'echo "tim ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/tim'
```