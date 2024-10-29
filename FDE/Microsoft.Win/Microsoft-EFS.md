# Microsoft EFS (Encrypted File System)

## Requirements, Supported Environment

NTFS

not REFS (REFS *does* support BitLocker)

### Recovery

AD CS GPO

*warning:* Default settings allow any user to encrypt a file without creating a recovery key.

### GUI

**User Accounts - Manage file encryption certificates** EFS REKEY wizard<br> 
`%windir%\system32\rekeywiz.exe`<br>
Comment: certificates keys signatures signed guard protect secure preserve files administer configure managed manages managing up setup

### Command Line

cipher.exe
