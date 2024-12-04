# PSCTLogsRoH

_The PSCTLogsRoH module queries the certificate transparency logs for information about the specified domain._

## Table of contents

1. [Introduction](#introduction)
2. [Getting started](#getting-started)
    1. [Prerequisites](#prerequisites)
    2. [Installation](#installation)
3. [How to use](#how-to-use)
    1. [How to import](#how-to-import)
    2. [Using the function](#using-the-function)
5. [License](/LICENSE)

## Introduction

I've written this module to verify informations about a domain certificate via cli.
This way the verification of a certificate and the process of installing / changing a certificate,
can be automated.

Currently only the free api of https://sslmate.com/ct_search_api/ is used, so the number of queries is limited to 100 per hour.

## Getting started

### Prerequisites

- Powershell installed, works with Windows Powershell (preinstalled on Windows) and Powershell Core
- Operatingsystem: Linux or Windows, not tested on mac
- IDE like VS Code, if you want to contribute or change the code

### Installation

The module is not published to PSGallery so you can only download it from github:

1. Using Git:

```PS
# Powershell
# Pull necessary files.
git clone "https://github.com/IT-Administrators/PSCTLogsRoH.git"
# Change location to project directory.
cd .\PSCTLogsRoH\
```

2. Using Powershell

```PS
# Download zip archive to current directory using powershell.
Invoke-WebRequest -Uri "https://github.com/IT-Administrators/PSCTLogsRoH/archive/refs/heads/main.zip" -OutFile "PSCTLogsRoH.zip"
# Than expand archive.
Expand-Archive -Path ".\PSCTLogsRoH.zip"
```

## How to use

### How to Import

You can import the module in two ways:

1. Import from current directory 
```PS
# Import from current directory
Import-Module -Path ".\PSCTLogsRoH.psm1" -Force -Verbose
```
2. Copy it to your module directory to get it imported on every session start. This depends also on your executionpolicy.

To get your module directorys use the following command:

```PS
$env:PSModulePath
```

### Using the function

After the module is imported, the function ```Get-PSCTLogs``` will be available. 

The following example is just a short demonstration on how to use the function. 

```PS
# Run the command.

Get-PSCTLogs -DomainName "example.com"

Output: 

id                : 6662227615
tbs_sha256        : bca4e466a942e392fa3f25ba37b4afd650e786f2427e060d10c77cfd1d1d3ed6
cert_sha256       : efba26d8c1ce3779ac77630a90f82163a3d6892ed6afee408672cf19eba7a362
dns_names         : {example.com, example.edu, example.net, example.org...}
pubkey_sha256     : cca78f9e3176c804c40ba3468282af0636f9364c830cdde63c6b51b2957abc17
issuer            : @{friendly_name=DigiCert; pubkey_sha256=59e738e674221702af1edb87c5200c1a4b75f64fae3d2c3d265124c61bd83c79; name=C=US, O=DigiCert Inc, CN=DigiCert Global G2 TLS RSA SHA256 2020 CA1}
not_before        : 2024-01-30T00:00:00Z
not_after         : 2025-03-01T23:59:59Z
revoked           : False
revocation        : @{time=; reason=; checked_at=2024-12-04T14:48:52Z}
problem_reporting : Send email to revoke@digicert.com or visit https://problemreport.digicert.com/
cert_der          : Base64 encoded certificat data
```

For more detailed examples use:

```PowerShell
Get-Help Get-PSCTLogs -Full
```

## License

[MIT](/LICENSE)