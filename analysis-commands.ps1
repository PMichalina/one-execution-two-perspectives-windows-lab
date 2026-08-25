# One Execution, Two Perspectives — Lab observations

## Scope
- Controlled Windows lab.
- Only self-created test files and owned/test accounts were used.
- No credentials, browser data, personal files or third-party systems were collected.
- Original execution payloads are intentionally excluded from the public repository.

## Observation timeline

### 1. Harmless marker simulation
A local Python proof of concept changed only the contents of dedicated test text files to a marker value (`[TOY_VIRUS_INFECTED]`). Re-running the test recognized files that had already been modified.

### 2. Execution chain
A `.bat` test file launched PowerShell. A visible console confirmed the chain from batch execution to PowerShell.

### 3. Short user-visible execution
The console stayed visible for roughly two seconds and then closed. This became the motivation for comparing the offensive execution perspective with persistent defensive telemetry.

### 4. External timestamp
A disposable webhook receiver observed a timestamp/status-only POST. Public evidence has been sanitized to remove endpoint identifiers, source IP and location data.

### 5. Delivery controls
The mail provider displayed a warning that the attachment could contain harmful software and required explicit acceptance of risk before download.

### 6. Windows trust warning
Windows warned that the publisher could not be verified before the batch file was launched.

### 7. Mark-of-the-Web
The downloaded file contained an NTFS `Zone.Identifier` alternate data stream. The observed `ZoneId=3` corresponded to Internet-zone origin.

### 8. File identification
A SHA-256 hash was collected to identify the exact tested sample independently of its filename.

### 9. PowerShell telemetry
`Get-WinEvent -LogName "Windows PowerShell"` showed events including 400, 600 and 403 around the execution time.

### 10. Event ID 4688 gap
Queries against the Security log for Event ID 4688 returned no matching events. Because PowerShell execution was independently evidenced elsewhere, the absence of 4688 was documented as a telemetry/auditing limitation rather than proof of non-execution.

## What I would add in v2
- Audit Process Creation verification/configuration.
- Sysmon.
- PowerShell Operational / Script Block Logging.
- Correlation rules across process, PowerShell and network telemetry.
