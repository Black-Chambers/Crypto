# Source from [ITProToday] (https://www.itprotoday.com/penton_modal/nojs/print/150855) by [Brien Posey] (https://www.itprotoday.com/author/Brien-Posey) 2024-01-22

# Password Generator

$Length=12

# Define Character Sets

$UpperCase=@('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z')
$LowerCase=@('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z')
$Numbers=@('1','2','3','4','5','6','7','8','9','0')
$Symbols=@('!','@','$','?','<','>','*','&')
$FullSet=@('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0','!','@','$','?','<','>','*','&')

# Check to see if all character sets are used

$HasUpperCase=0
$HasLowerCase=0
$HasNumbers=0
$HasSymbols=0



While($HasUpperCase -eq 0 -or $HasLowerCase -eq 0 -or $HasNumbers -eq 0 -or $HasSymbols -eq 0)
{
# Generate New Password

# Initialize password variable

$Password=""

$PasswordArray = $FullSet | Get-Random -Count $Length
For ($Index=0; $Index -lt $Length; $Index++)
            {
            $Password=$Password+$PasswordArray[$Index]
            }


# Test the password that has been created

For ($Index=0;$Index -lt $Length; $Index++)
            {
            $Character=$Password.Substring($Index,1)
            If ($UpperCase -Ccontains $Character) {$HasUpperCase=1}
            If ($LowerCase -Ccontains $Character) {$HasLowerCase=1}
            If ($Numbers -Contains $Character) {$HasNumbers=1}
            If ($Symbols -Contains $Character) {$HasSymbols=1}
            }
}

# Display Password

Write-Host "The new password is: " $Password
Set-Clipboard -Value $Password
