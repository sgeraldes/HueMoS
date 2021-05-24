# Hue Bridge
$hueBridge = "http://192.168.XXX.YYY/api"

# Username
$username = 'your_username'

# Light to control
$light = 1

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
