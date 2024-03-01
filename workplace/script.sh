#!/bin/bash

# Paths to key files
private_key_user1="private_key_user1.pem"
public_key_user2="public_key_user2.pem"

# Generate a file
echo "Step 1: Generating content..."
echo "Generated content at $(date)" > generated_file.txt
echo "Step 1: File generated."

# Logging the content of generated_file.txt
echo "Step 1: Contents of generated_file.txt"
cat generated_file.txt

# Generate a digital signature
echo "Step 2: Creating digital signature..."
openssl dgst -sha256 -sign $private_key_user1 -out signature.txt generated_file.txt
echo "Step 2: Digital signature created."

# Forward data to another user
echo "Step 3: Forwarding data to another user..."
scp generated_file.txt signature.txt kali@192.168.56.105:/home/kali/encryption
echo "Step 3: Files forwarded to another user."

# Logging the content of signature.txt
echo "Step 3: Contents of signature.txt"
cat signature.txt

# Decrypt the data using rsautl
echo "Step 4: Decrypting data..."
ssh kali@192.168.56.105 "openssl rsautl -decrypt -inkey /home/kali/encryption/$private_key_user1 -in /home/kali/encryption/generated_file.txt -out /home/kali/encryption/decrypted_data.txt"
echo "Step 4: Data decrypted."

# Display the decrypted data
echo "Step 5: Displaying decrypted data..."
cat /home/kali/encryption/decrypted_data.txt
echo "Step 5: Done."

