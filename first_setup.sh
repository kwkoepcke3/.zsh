#!/usr/bin/env bash

sudo loginctl enable-linger $USER
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
