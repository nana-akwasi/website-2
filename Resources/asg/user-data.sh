#!/bin/bash

# Install Nginx
amazon-linux-extras install nginx1.12

# Back up existing config
mv /etc/nginx /etc/nginx-backup

# Download the configuration from S3
aws s3 cp s3://{my_bucket}/nginxconfig.io-example.com.zip /tmp

# Install new configuration
unzip /tmp/nginxconfig.io-example.com.zip -d /etc/nginx

systemctl start nginx