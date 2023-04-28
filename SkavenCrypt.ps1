<#
.SYNOPSIS
Encrypts or decrypts a file using XorCrypt.exe or AESCrypt.exe.

.DESCRIPTION
This module accepts the following parameters:
- operation: The operation to perform. Valid values are "encrypt" or "decrypt".
- inputFile: The path to the input file to encrypt or decrypt.
- outputFile: The path to the output file to create.
- keyword: The encryption keyword to use.
- standard: The encryption standard to use. Valid values are "aes" or "xor".

If "aes" is selected as the encryption standard, the keyword must be 16, 24, or 32 bytes in length to match the AES key size.

.EXAMPLE
PS C:\> .\SkavenCrypt.ps1 encrypt input.txt encryptedoutput.txt MyKeyword aes

Encrypts the "input.txt" file using AES encryption with the "MyKeyword" keyword and saves the result to the "encryptedoutput.txt" file.

.NOTES
Author: mellonaut
Last Updated: 4/11/2023
Version: 1.0
#>


[CmdletBinding()]
param (
    [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateSet('encrypt', 'decrypt')]
    [string]$operation,

    [Parameter(Position = 1, Mandatory = $true, ValueFromPipeline = $true)]
    [string]$inputFile,

    [Parameter(Position = 2, Mandatory = $true, ValueFromPipeline = $true)]
    [string]$outputFile,

    [Parameter(Position = 3, Mandatory = $true, ValueFromPipeline = $true)]
    [string]$keyword,

    [Parameter(Position = 4, Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateSet('aes', 'xor')]
    [string]$method
)

if ($method -eq 'xor') {
    # Run XorCrypt.exe to encrypt or decrypt the file
    Write-Output "Encrypting file using Xor.."
    $xorCryptExe = '.\XorCrypt.exe'
    $xorCryptArgs = @($operation, $inputFile, $outputFile, $keyword)
    & $xorCryptExe $xorCryptArgs
}
elseif ($method -eq 'aes') {
    # Run AESCrypt.exe to encrypt or decrypt the file
    Write-Output "Encrypting file using AES.."
    $aesCryptExe = '.\AESCrypt.exe'
    $aesCryptArgs = @($operation, $inputFile, $outputFile, $keyword)
    & $aesCryptExe $aesCryptArgs
}

# Write-Output "Base64 encoding outputfile to $outputFile.b64"
Write-Output "Base64 command: base64.exe -e -n 0 -i $outputFile -o $outputFile.b64"