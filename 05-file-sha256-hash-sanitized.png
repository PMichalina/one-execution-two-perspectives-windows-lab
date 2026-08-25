# Defensive / analysis commands used in the lab
# These commands inspect files and Windows telemetry. They do not contain the original execution payload.

# Basic file metadata
Get-Item "$HOME\Downloads\sample.bat" |
    Select-Object Name, FullName, Length, CreationTime, LastWriteTime

# Enumerate NTFS streams (including Zone.Identifier when present)
Get-Item "$HOME\Downloads\sample.bat" -Stream *

# Read Mark-of-the-Web metadata
Get-Content "$HOME\Downloads\sample.bat" -Stream Zone.Identifier

# Calculate a SHA-256 fingerprint
Get-FileHash "$HOME\Downloads\sample.bat" -Algorithm SHA256

# Inspect recent Windows PowerShell events
Get-WinEvent -LogName "Windows PowerShell" -MaxEvents 10 |
    Select-Object TimeCreated, Id, LevelDisplayName, Message

# Attempt to correlate process creation in the Security log
Get-WinEvent -FilterHashtable @{
    LogName   = 'Security'
    Id        = 4688
    StartTime = (Get-Date).AddMinutes(-10)
} -MaxEvents 20 |
    Select-Object TimeCreated, Id, Message
