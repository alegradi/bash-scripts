#!/bin/bash
# Testing using an environment variable in your bash script

# Declare shell variable option #1
# HELLO="hi there"

# Declare shell variable option #2
# read -s HELLO

# Export shell variable, making it an environment variable
export HELLO

echo $HELLO
