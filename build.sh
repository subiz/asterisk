#!/bin/bash

docker build --network host -t live360vn/asterisk:18.20.0 .
docker push live360vn/asterisk:18.20.0
