#!/bin/bash

device="$(sudo dmidecode --string chassis-type)"

if [[ $device = "Laptop" ]]; then
  echo "Running from laptop"
fi
