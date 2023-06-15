# SkavenCryptIV

Standalone C# executables wrapped lovingly in powershell. Will pass everything to the binary and accepts values from pipeline by name.

Encrypts or decrypts a file using XorCrypt.exe or AESCrypt.exe.

# DESCRIPTION
This tool accepts the following parameters:
- operation: The operation to perform. Valid values are "encrypt" or "decrypt".
- inputFile: The path to the input file to encrypt or decrypt.
- outputFile: The path to the output file to create.
- keyword: The encryption keyword to use.
- standard: The encryption standard to use. Valid values are "aes" or "xor".

If "aes" is selected as the encryption standard, the keyword must be 16, 24, or 32 bytes in length to match the AES key size.

# AES Encryption
### To encrypt a file using AES encryption, you can use the following command:

.\SkavenCrypt.ps1 encrypt C:\input.txt C:\encryptedoutput.txt ImASixteenBitKey aes

### This command encrypts the C:\input.txt file using AES encryption with the ImASixteenBitKey keyword and saves the encrypted result to the C:\encryptedoutput.txt file.

### To decrypt the encrypted file, you can use the following command:

.\SkavenCrypt.ps1 decrypt C:\encryptedoutput.txt C:\decryptedoutput.txt ImASixteenBitKey aes

### This command decrypts the C:\encryptedoutput.txt file using AES decryption with the ImASixteenBitKey keyword and saves the decrypted result to the C:\decryptedoutput.txt file.


# Xor Encryption
### To encrypt a file using Xor encryption, you can use the following command:

.\SkavenCrypt.ps1 encrypt C:\input.txt C:\encryptedoutput.txt MyXorKey xor

### This command encrypts the C:\input.txt file using Xor encryption with the MyXorKey keyword and saves the encrypted result to the C:\encryptedoutput.txt file.

### To decrypt the encrypted file, you can use the following command:

.\SkavenCrypt.ps1 decrypt C:\encryptedoutput.txt C:\decryptedoutput.txt MyXorKey xor

### This command decrypts the C:\encryptedoutput.txt file using Xor decryption with the MyXorKey keyword and saves the decrypted result to the C:\decryptedoutput.txt file.

