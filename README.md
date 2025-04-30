### Запустить:
```bash
curl -fsSL 'https://raw.githubusercontent.com/triplebleed/update-clean-linux/main/update-clean-linux.sh' | sudo bash
```

### В sudo crontab -e:
```bash
0 5 * * 1 /usr/bin/curl -fsSL 'https://raw.githubusercontent.com/triplebleed/update-clean-linux/main/update-clean-linux.sh' | /bin/bash > /var/log/update-clean-linux.log 2>&1
```
