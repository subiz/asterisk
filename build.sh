#!/bin/bash
docker build -t live360vn/asterisk:18.13.0 .
docker push live360vn/asterisk:18.13.0
