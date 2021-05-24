# HUEMoS

## Description

HUEMoS (short for HUE Mouse Sensor) is a set of powershell scripts that automates lights on computer events.  can turn on or off your hue lights based on an idle timer (mouse movement or keyboard activity).

It uses Window's idle timer to identify when to turn it off.

## Configuration

All configuration can be changed in variables.ps1:

* Server IP
* Username (Token)

## Setup

Optional, but highly recommended to set your Hue Bridge's IP to static.

The setup process at a high level is:

* Obtain your Bridge IP and unique token (username)
* Updates hue_variables.ps1 with the proper information

### Get the Bridge IP and Obtain a token (Auth Username)

1. First, get the Hue Bridge's IP: <https://discovery.meethue.com/>
2. Get an Authenticated Username / Token: <http://`bridge_IP`/debug/clip.html>
3. Post a message to /api with the proper message body: {"devicetype" : "My Awesome HUEMoS Script name"}
4. Copy the `username` from the Command Response and update `hue_variables.ps1`

### Test the connection and obtain your light ID

1. List your lights with <http://`bridge_IP`/debug/clip.html>
2. In the URL use: /api/`username`/lights and click on GET
3. You should be returned with a list of lights connected to the Philips HUE Bridge
4. Find the light you want to control and update `hue_variables.ps1` with it
5. Try opening a new powershell prompt and running .\hue_switch to switch your light on/off

Your hue_variables.ps1 file should look something like this:

```PowerShell
# Hue Bridge
$hueBridge = "http://192.168.XXX.YYY/api"

# Username
$username = 'YOUR_VERY_LONG_USERNAME'

# Light to control
$light = 11

# Philips HUE Commands Hash Table
$apicontent = @{
    # Command to Turn on
    on  = '{ "on": true }'
    # Command to Turn off
    off = '{ "on": false }'
    # Command to Increase Brightness
    inc = '{ "on": true, "bri_inc":  25 }'
    # Command to Decrease Brightness
    dec = '{ "on": true, "bri_inc": -25 }'
}
```

## Hidding the console window pop-up

I'm using @SeidChr <https://github.com/SeidChr/RunHiddenConsole> project to run a hidden powershell console. Simply compile the binary from that repo, rename to powershellw.exe and drop into \Windows\System32\WindowsPowerShell\v1.0

User PowerShellw.exe to call your PS scripts instead of the regular powershell.

These scripts are bind to a series of keyboard shortcuts using LG Hub.

I'm currently using a Logitech G915 Wireless and had set the G1-G5 keys for lights:

* G1: powershellw.exe -windowstyle hidden -File C:\Users\User\Documents\HUEMoS\hue_switch.ps1
* G2: powershellw.exe -windowstyle hidden -File C:\Users\User\Documents\HUEMoS\screen_off.ps1
* G3: powershellw.exe -windowstyle hidden -File C:\Users\User\Documents\HUEMoS\hue_sensor.ps1
* G4: powershellw.exe -windowstyle hidden -File C:\Users\User\Documents\HUEMoS\hue_bri_inc.ps1
* G5: powershellw.exe -windowstyle hidden -File C:\Users\User\Documents\HUEMoS\hue_bri_dec.ps1

## Credits

* RunHiddenConsole from <https://github.com/SeidChr/RunHiddenConsole>
* Darren Robinson - Command your Philips Hue Lights with Powershell: <https://blog.darrenjrobinson.com/commanding-your-philips-hue-lights-with-powershell/>
* Koen van Zeijl - Toggle Philips hue lights depending on your pc state: <https://levelup.gitconnected.com/toggle-philips-hue-depending-on-your-pc-state-8d7dc1e4f5b>

## Checklist and next steps

* [ ] Turn this into a service
* [ ] Handle bridge and light discovery
* [ ] maybe use HUEPos

## Keywords

philips, hue, lights, sensor, mouse, idle, silent, script, hidden, console, window, command, commandline, hide
