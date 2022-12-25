Power measurements on kobo nia, with inkbox os using my own device with precission arround 5-20 mA
- Without doubt the device when USB is connected doesn't draw anything from its own battery
- At idle, in inkbox without backlight it draws about 60 mA
- On clicks, for around 3 seconds because of screen refresh and cpu usage it draws +100mA
- Connected wifi adds arround 15mA on idle, with ssh connection active but even spamming enter on it causes +80mA
- 50% backlight adds 40mA, 100% another 40mA
- In sleep it draws 15-5mA, so with 1200mAh battery it gives at best 240 h. I think it goes better without the charger, and it lasts longer
- Charging: Starts with 500mA, slowly goes to 200mA at arround 85%, and then to 100mA and if it hits 100%, it stops charging and gets all power from the charger
- `performance` frequency governor doesn't change anything? maybe 5mA... but makes everything faster so thats a win

[Thanks to Andi](https://github.com/Szybet/niAudio/blob/main/discord-exports/The%20*Box%20Project%20-%20Working%20with%20i2c%20to%20shut%20down%20the%20charging%20circuit.html), those commands help with this issue:
This command does that the battery isin't used, it isin't even charged but USB power is redirected to device
```
i2cset -y -f 3 0x32 0xb3 0x20
```
This stops using USB completely ( can't be changed back without disconnecting usb port )
```
i2cset -y -f 3 0x32 0xb3 0x10
```
Experimental may turn into fire, supplies 5V down the line. Wasn't tested, and for 100% not designed for that so don't.
```
i2cset -y -f 3 0x32 0xb3 0x30
```
I will implement those commands ( only the 0x20 ) [here](https://github.com/Szybet/Charger-controller)
