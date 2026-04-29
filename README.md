Link to [fork of Dice Word list](https://github.com/Black-Chambers/Diceware-word-lists) repository

```
executeShellCommandToVariable as System
powershell.exe Invoke-restmethod -uri "http://www.dinopass.com/password/Strong"
```

Invoke-RestMethod -uri "https://www.dinopass.com/password/Strong"


[**Windows** PowerShell]
```Add-Type -AssemblyName System.Web; [System.Web.Security.Membership]::GeneratePassword(12,1)```

**Author:** [![ORCID](https://img.shields.io/badge/ORCID-0009--0006--9145--2089-brightgreen?logo=orcid)](https://orcid.org/0009-0006-9145-2089)
