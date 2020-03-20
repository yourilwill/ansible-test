#!/bin/env bash

yum update -y
yum install -y epel-release python-devel openssl-devel gcc
yum install -y python-pip

pip install --upgrade pip

pip install ansible
