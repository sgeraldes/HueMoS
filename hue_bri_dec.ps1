# Import our HUE Bridge variables (Username and Bridge IP)
. $PSScriptRoot\hue_variables.ps1

# Invoke commands
Invoke-WebRequest -Method put -Uri "$($hueBridge)/$($username)/lights/$($light)/state" -Body $apicontent.dec -UseBasicParsing