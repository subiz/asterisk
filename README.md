# Asterisk
Reproducible Asterisk (18.14.0) and MySQL

### Build the image
```
docker build -t live360vn/asterisk:18.14.0 .
```

### Menuselect
This modules is disabled

* Applications > app_adsiprog

* PBX Modules > DUNDi
* Channel Drivers >  chan_iax2
* Channel Drivers > chan_sip
* Resource Modules > res_fax

This modules must be enabled
* Codec Translators > codec_opus
* Codec Translators > codec_silk
* Codec Translators > codec_siren7
* Codec Translators > codec_siren17
* Codec Translators > codec_g729a
* Compile Flags > DONT OPTIMIZE (for debugging purpose)
* Compile Flags > COMPILE_DOUBLE
* Compile Flags > MALLOC_DEBUG

### Update
1. Download new version of asterisk at https://www.asterisk.org/downloads/#asterisk
