## Kali Linux

### Install Remote Desktop

```bash
sudo apt install -y xrdp xorg kali-desktop-xfce
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo systemctl enable xrdp-sesman
sudo systemctl start xrdp-sesman
```

Then try to connect with your user using `mstsc.exe` using your IP.

