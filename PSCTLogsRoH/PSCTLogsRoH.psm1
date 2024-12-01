<#
.SYNOPSIS
    Check certificate transparency logs.

.DESCRIPTION
    Check certificate transparency logs for the specified domain.
    
    Currently one the free api is supported which is 100 queries per hour.

    All information you can get with this module is also available on https://sslmate.com/ct_search_api/.

.PARAMETER DomainName
    The name of the domain to check logs for.

.PARAMETER SearchSubDomains
    Include all subdomains of the specified domain.

.PARAMETER ShowDnsNames
    Show dnsnames of the specified domain.

.PARAMETER ShowIssuer
    Show issuer information. 

.PARAMETER ShowRevocationInfo
    Show info about the revocation of the certificate.

.PARAMETER ShowProblemReportingInfo
    Show who to contact when problems occure with the certificate.

.PARAMETER ShowCertData
    Show certificate data. This data is encoding as base64.

.EXAMPLE
    Get all informations for the example.com domain.

    Get-PSCTLogs

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
    revocation        : @{time=; reason=; checked_at=2024-12-01T10:48:33Z}
    problem_reporting : Send email to revoke@digicert.com or visit https://problemreport.digicert.com/
    cert_der          : MIIHbjCCBlagAwIBAgIQB1vO8waJyK3fE+Ua9K/hhzANBgkqhkiG9w0BAQsFADBZMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMTMwMQYDVQQDEypEaWdpQ2VydCBHbG9iYWwgRzIgVExTIFJTQSBTSEEyNTYgMjAyMCBDQTEwHhcNMjQwMTMwMDAwMDAwWhcNMjUwM
                        zAxMjM1OTU5WjCBljELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFDASBgNVBAcTC0xvcyBBbmdlbGVzMUIwQAYDVQQKDDlJbnRlcm5ldMKgQ29ycG9yYXRpb27CoGZvcsKgQXNzaWduZWTCoE5hbWVzwqBhbmTCoE51bWJlcnMxGDAWBgNVBAMTD3d3dy5leGFtcGxlLm 
                        9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIaFD7sO+cpf2fXgCjIsM9mqDgcpqC8IrXi9wga/9y0rpqcnPVOmTMNLsid3INbBVEm4CNr5cKlh9rJJnWlX2vttJDRyLkfwBD+dsVvivGYxWTLmqX6/1LDUZPVrynv/cltemtg/1Aay88jcj2ZaRoRmqBgVeacIzgU8+zm 
                        J7236TnFSe7fkoKSclsBhPaQKcE3Djs1uszJs8sdECQTdoFX9I6UgeLKFXtg7rRf/hcW5dI0zubhXbrW8aWXbCzySVZn0c7RkJMpnTCiZzNxnPXnHFpwr5quqqjVyN/aBKkjoP04Zmr+eRqoyk/+lslq0sS8eaYSSHbC5ja/yMWyVhvMCAwEAAaOCA/IwggPuMB8GA1UdIwQYMBaAFHSF 
                        gMBmx9833s+9KTeqAx2+7c0XMB0GA1UdDgQWBBRM/tASTS4hz2v68vK4TEkCHTGRijCBgQYDVR0RBHoweIIPd3d3LmV4YW1wbGUub3JnggtleGFtcGxlLm5ldIILZXhhbXBsZS5lZHWCC2V4YW1wbGUuY29tggtleGFtcGxlLm9yZ4IPd3d3LmV4YW1wbGUuY29tgg93d3cuZXhhbXBsZ 
                        S5lZHWCD3d3dy5leGFtcGxlLm5ldDA+BgNVHSAENzA1MDMGBmeBDAECAjApMCcGCCsGAQUFBwIBFhtodHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjCBnwYDVR0fBIGXMIGUMEigRqBEhkJodHRwOi 
                        8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9iYWxHMlRMU1JTQVNIQTI1NjIwMjBDQTEtMS5jcmwwSKBGoESGQmh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbEcyVExTUlNBU0hBMjU2MjAyMENBMS0xLmNybDCBhwYIKwYBBQUHAQEEezB5MCQGCCsGAQU 
                        FBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wUQYIKwYBBQUHMAKGRWh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbEcyVExTUlNBU0hBMjU2MjAyMENBMS0xLmNydDAMBgNVHRMBAf8EAjAAMIIBfQYKKwYBBAHWeQIEAgSCAW0EggFpAWcAdABOdaMn 
                        XJoQwzhbbNTfP1LrHfDgjhuNacCx+mSxYpo53wAAAY1b0vxkAAAEAwBFMEMCH0BRCgxPbBBVxhcWZ26a8JCe83P1JZ6wmv56GsVcyMACIDgpMbEo5HJITTRPnoyT4mG8cLrWjEvhchUdEcWUuk1TAHYAfVkeEuF4KnscYWd8Xv340IdcFKBOlZ65Ay/ZDowuebgAAAGNW9L8MAAABAMAR 
                        zBFAiBdv5Z3pZFbfgoM3tGpCTM3ZxBMQsxBRSdTS6d8d2NAcwIhALLoCT9mTMN9OyFzIBV5MkXVLyuTf2OAzAOa7d8x2H6XAHcA5tIxY0B3jMEQQQbXcbnOwdJA9paEhvu6hzId/R43jlAAAAGNW9L8XwAABAMASDBGAiEA4Koh/VizdQU1tjZ2E2VGgWSXXkwnQmiYhmAeKcVLHeACIQ 
                        D7JIGFsdGol7kss2pe4lYrCgPVc+iGZkuqnj26hqhr0TANBgkqhkiG9w0BAQsFAAOCAQEABOFuAj4N4yNG9OOWNQWTNSICC4Rd4nOG1HRP/Bsnrz7KrcPORtb6D+Jx+Q0amhO31QhIvVBYs14gY4Ypyj7MzHgm4VmPXcqLvEkxb2G9Qv9hYuEiNSQmm1fr5QAN/0AzbEbCM3cImLJ69kP 
                        5bUjfv/76KB57is8tYf9sh5ikLGKauxCM/zRIcGa3bXLDafk5S2g5Vr2hs230d/NGW1wZrE+zdGuMxfGJzJP+DAFviBfcQnFg4+1zMEKcqS87oniOyG+60RMM0MdejBD7AS43m9us96Gsun/4kufLQUTIFfnzxLutUV++3seshgefQOy5C/ayi8y1VTNmujPCxPCi6Q==

.EXAMPLE
    Get informations for the example.com domain, excluding the dnsnames.

    id                : 6662227615
    tbs_sha256        : bca4e466a942e392fa3f25ba37b4afd650e786f2427e060d10c77cfd1d1d3ed6
    cert_sha256       : efba26d8c1ce3779ac77630a90f82163a3d6892ed6afee408672cf19eba7a362
    pubkey_sha256     : cca78f9e3176c804c40ba3468282af0636f9364c830cdde63c6b51b2957abc17
    issuer            : @{friendly_name=DigiCert; pubkey_sha256=59e738e674221702af1edb87c5200c1a4b75f64fae3d2c3d265124c61bd83c79; name=C=US, O=DigiCert Inc, CN=DigiCert Global G2 TLS RSA SHA256 2020 CA1}
    not_before        : 2024-01-30T00:00:00Z
    not_after         : 2025-03-01T23:59:59Z
    revoked           : False
    revocation        : @{time=; reason=; checked_at=2024-12-01T10:48:33Z}
    problem_reporting : Send email to revoke@digicert.com or visit https://problemreport.digicert.com/
    cert_der          : MIIHbjCCBlagAwIBAgIQB1vO8waJyK3fE+Ua9K/hhzANBgkqhkiG9w0BAQsFADBZMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMTMwMQYDVQQDEypEaWdpQ2VydCBHbG9iYWwgRzIgVExTIFJTQSBTSEEyNTYgMjAyMCBDQTEwHhcNMjQwMTMwMDAwMDAwWhcNMjUwM
                        zAxMjM1OTU5WjCBljELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFDASBgNVBAcTC0xvcyBBbmdlbGVzMUIwQAYDVQQKDDlJbnRlcm5ldMKgQ29ycG9yYXRpb27CoGZvcsKgQXNzaWduZWTCoE5hbWVzwqBhbmTCoE51bWJlcnMxGDAWBgNVBAMTD3d3dy5leGFtcGxlLm 
                        9yZzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIaFD7sO+cpf2fXgCjIsM9mqDgcpqC8IrXi9wga/9y0rpqcnPVOmTMNLsid3INbBVEm4CNr5cKlh9rJJnWlX2vttJDRyLkfwBD+dsVvivGYxWTLmqX6/1LDUZPVrynv/cltemtg/1Aay88jcj2ZaRoRmqBgVeacIzgU8+zm 
                        J7236TnFSe7fkoKSclsBhPaQKcE3Djs1uszJs8sdECQTdoFX9I6UgeLKFXtg7rRf/hcW5dI0zubhXbrW8aWXbCzySVZn0c7RkJMpnTCiZzNxnPXnHFpwr5quqqjVyN/aBKkjoP04Zmr+eRqoyk/+lslq0sS8eaYSSHbC5ja/yMWyVhvMCAwEAAaOCA/IwggPuMB8GA1UdIwQYMBaAFHSF 
                        gMBmx9833s+9KTeqAx2+7c0XMB0GA1UdDgQWBBRM/tASTS4hz2v68vK4TEkCHTGRijCBgQYDVR0RBHoweIIPd3d3LmV4YW1wbGUub3JnggtleGFtcGxlLm5ldIILZXhhbXBsZS5lZHWCC2V4YW1wbGUuY29tggtleGFtcGxlLm9yZ4IPd3d3LmV4YW1wbGUuY29tgg93d3cuZXhhbXBsZ 
                        S5lZHWCD3d3dy5leGFtcGxlLm5ldDA+BgNVHSAENzA1MDMGBmeBDAECAjApMCcGCCsGAQUFBwIBFhtodHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjCBnwYDVR0fBIGXMIGUMEigRqBEhkJodHRwOi 
                        8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRHbG9iYWxHMlRMU1JTQVNIQTI1NjIwMjBDQTEtMS5jcmwwSKBGoESGQmh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbEcyVExTUlNBU0hBMjU2MjAyMENBMS0xLmNybDCBhwYIKwYBBQUHAQEEezB5MCQGCCsGAQU 
                        FBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wUQYIKwYBBQUHMAKGRWh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbEcyVExTUlNBU0hBMjU2MjAyMENBMS0xLmNydDAMBgNVHRMBAf8EAjAAMIIBfQYKKwYBBAHWeQIEAgSCAW0EggFpAWcAdABOdaMn 
                        XJoQwzhbbNTfP1LrHfDgjhuNacCx+mSxYpo53wAAAY1b0vxkAAAEAwBFMEMCH0BRCgxPbBBVxhcWZ26a8JCe83P1JZ6wmv56GsVcyMACIDgpMbEo5HJITTRPnoyT4mG8cLrWjEvhchUdEcWUuk1TAHYAfVkeEuF4KnscYWd8Xv340IdcFKBOlZ65Ay/ZDowuebgAAAGNW9L8MAAABAMAR 
                        zBFAiBdv5Z3pZFbfgoM3tGpCTM3ZxBMQsxBRSdTS6d8d2NAcwIhALLoCT9mTMN9OyFzIBV5MkXVLyuTf2OAzAOa7d8x2H6XAHcA5tIxY0B3jMEQQQbXcbnOwdJA9paEhvu6hzId/R43jlAAAAGNW9L8XwAABAMASDBGAiEA4Koh/VizdQU1tjZ2E2VGgWSXXkwnQmiYhmAeKcVLHeACIQ 
                        D7JIGFsdGol7kss2pe4lYrCgPVc+iGZkuqnj26hqhr0TANBgkqhkiG9w0BAQsFAAOCAQEABOFuAj4N4yNG9OOWNQWTNSICC4Rd4nOG1HRP/Bsnrz7KrcPORtb6D+Jx+Q0amhO31QhIvVBYs14gY4Ypyj7MzHgm4VmPXcqLvEkxb2G9Qv9hYuEiNSQmm1fr5QAN/0AzbEbCM3cImLJ69kP 
                        5bUjfv/76KB57is8tYf9sh5ikLGKauxCM/zRIcGa3bXLDafk5S2g5Vr2hs230d/NGW1wZrE+zdGuMxfGJzJP+DAFviBfcQnFg4+1zMEKcqS87oniOyG+60RMM0MdejBD7AS43m9us96Gsun/4kufLQUTIFfnzxLutUV++3seshgefQOy5C/ayi8y1VTNmujPCxPCi6Q==

.NOTES
    Written and testet in PowerShell 5.1.

.LINK
    https://github.com/IT-Administrators/PSCTLogsRoH
#>

function Get-PSCTLogs {
    
    [CmdletBinding(DefaultParameterSetName='GetCTLogInfoDomain', 
                   SupportsShouldProcess=$true)]
    param(
        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        ValueFromPipeline,
        HelpMessage='Domain name.')]
        [String]$DomainName = "example.com",

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Search sub domains.')]
        [bool]$SearchSubDomains = $true,

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Show DNS names.')]
        [bool]$ShowDnsNames = $true,

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Show issuer.')]
        [bool]$ShowIssuer = $true,

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Show revocation info.')]
        [bool]$ShowRevocationInfo = $true,

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Show problem reporting instructions.')]
        [bool]$ShowProblemReportingInfo = $true,

        [Parameter(
        ParameterSetName='GetCTLogInfoDomain',
        Position=0,
        HelpMessage='Show revocation info.')]
        [bool]$ShowCertData = $true
)
    
    begin {
        # Default api url.
        $API_URL = "https://api.certspotter.com/v1/issuances?domain=$($DomainName)"
        # Save default api url to create rest api substrings.
        $NewApiUrl = $API_URL
        # Possible reststrings depending on the specified parameter.
        $RestParameterHt = @{
            "SearchSubDomains" = "&include_subdomains=true"
            "ShowDnsNames" = "&expand=dns_names"
            "ShowIssuer" = "&expand=issuer"
            "ShowRevocation" = "&expand=revocation"
            "ShowProblemReportInfo" = "&expand=problem_reporting"
            "ShowCertData" = "&expand=cert_der"
        }
        # If no parameter is used, show all informations.
        if ($PSBoundParameters.Count -eq 0) {
            $NewApiUrl = $API_URL + $RestParameterHt.SearchSubDomains + $RestParameterHt.ShowDnsNames + $RestParameterHt.ShowIssuer + $RestParameterHt.ShowRevocation + $RestParameterHt.ShowProblemReportInfo + $RestParameterHt.ShowCertData
        }
        # If a parameter is used. The correct url parameter is appended.
        switch ($PSBoundParameters.Count -gt 0) {
            $SearchSubDomains { $NewApiUrl = $NewApiUrl + $RestParameterHt.SearchSubDomains }
            $ShowDnsNames { $NewApiUrl = $NewApiUrl + $RestParameterHt.ShowDnsNames }
            $ShowIssuer { $NewApiUrl = $NewApiUrl + $RestParameterHt.ShowIssuer }
            $ShowRevocationInfo { $NewApiUrl = $NewApiUrl + $RestParameterHt.ShowRevocation }
            $ShowProblemReportingInfo { $NewApiUrl = $NewApiUrl + $RestParameterHt.ShowProblemReportInfo }
            $ShowCertData { $NewApiUrl = $NewApiUrl + $RestParameterHt.ShowCertData }
            Default {$NewApiUrl}
        }
    }
    
    process {
        # Get information.
        # Invoke-RestMethod -Method Get -Uri $NewApiUrl
        if ($PSCmdlet.ShouldProcess($NewApiUrl, "Get")) {
            Invoke-RestMethod -Method Get -Uri $NewApiUrl
        }
    }
    
    end {
        
    }
}

Export-ModuleMember -Function "Get-PSCTLogs" -Verbose