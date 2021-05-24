# Import our HUE Bridge variables (Username and Bridge IP)
. $PSScriptRoot\hue_variables.ps1

$result = Invoke-RestMethod -Method Get -Uri "$($hueBridge)/$($username)/lights"
$currentState = $result.$light | Select-Object state

If ($currentState.state.on.Equals($false)) {
    $body = @{"on" = $true } | ConvertTo-Json
    Write-Host "Light $light is OFF, turning it ON"
}
else {
    $body = @{"on" = $false } | ConvertTo-Json
    Write-Host "Light $light is ON, turning it OFF"
}

$result = Invoke-RestMethod -Method PUT -Uri "$($hueBridge)/$($username)/lights/$($light)/state" -Body $body
$result