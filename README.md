# Asterisk
Reproducible Asterisk (18.14.0) and MySQL

### Build the image
```
docker build -t live360vn/asterisk:18.14.0 .
```

### Menuselect
This modules is disabled
* DUNDi
* chan_iax2
* chan_sip

This modules must be enabled
* Compile flags > DONT OPTIMIZE (for debugging purpose)

### Update
1. Download new version of asterisk at https://www.asterisk.org/downloads/#asterisk
