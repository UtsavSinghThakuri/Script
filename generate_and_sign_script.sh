#!/bin/bash

# Step i: Generate a file
echo "This is some data for encryption" > /path/to/generated_file.txt

# Step ii: Generate a digital signature
openssl dgst -sha256 -sign /path/to/private_key.pem -out /path/to/digital_signature /path/to/generated_file.txt

# Step iii: Forward the data to another user (copy to FolderB)
cp /path/to/generated_file.txt /home/kali/FolderB/

# Step iv: Decrypt the data
openssl dgst -sha256 -verify /path/to/public_key.pem -signature /path/to/digital_signature /path/to/generated_file.txt

# Optionally, you can perform any additional steps here

echo "Script executed successfully"
