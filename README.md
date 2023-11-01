# Asterisk
Reproducible Asterisk (18.20.0) and MySQL


```

                   .$$$$$$$$$$$$$$$=..
                .$7$7..          .7$$7:.
              .$$:.                 ,$7.7
            .$7.     7$$$$           .$$77
         ..$$.       $$$$$            .$$$7
        ..7$   .?.   $$$$$   .?.       7$$$.
       $.$.   .$$$7. $$$$7 .7$$$.      .$$$.
     .777.   .$$$$$$77$$$77$$$$$7.      $$$,
     $$$~      .7$$$$$$$$$$$$$7.       .$$$.
    .$$7          .7$$$$$$$7:          ?$$$.
    $$$          ?7$$$$$$$$$$I        .$$$7
    $$$       .7$$$$$$$$$$$$$$$$      :$$$.
    $$$       $$$$$$7$$$$$$$$$$$$    .$$$.
    $$$        $$$   7$$$7  .$$$    .$$$.
    $$$$             $$$$7         .$$$.
    7$$$7            7$$$$        7$$$
     $$$$$                        $$$
      $$$$7.                       $$  (TM)
       $$$$$$$.           .7$$$$$$  $$
         $$$$$$$$$$$$7$$$$$$$$$.$$$$$$
           $$$$$$$$$$$$$$$$.


```

### Build the image
```
docker build --network host -t live360vn/asterisk:18.20.0 .
```

### Menuselect
This modules is disabled

* Applications > app_adsiprog

* Channel Drivers >  chan_iax2
* Channel Drivers > chan_sip
* Channel Drivers > chan_skinny
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

### Manually make select option

docker build --progress=plain --network host -t asterisk -f Dockerfile.build .

### Copy conf directory
First, run a container
```sh
docker run --name asterisk --rm -it --network host live360vn/asterisk:18.20.0
```

In another terminal, run
```sh
docker cp  asterisk:/etc/asterisk asterisk-conf
```
