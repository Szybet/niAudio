### Quick guide for my 3D printed case
if something doesn't fits you, change it, step files are available

And a warning, its your own responsibility if you break somethings. Also you need some good soldering skills. If the device is opened, disconnect the battery and click the power button for ~3s to be sure every capacitor is discharger

## 3D printing advice
0.4 nozzle or less, good bridging and connection between layers needs to be really solid. Use a string filament for this. For better bottom look, i printed it on yellow tape. Ideal, printing it on a resin printer would be great.

### first, serial connection
Use capton tape and add it below the serial pads because if you add too much solder, and the solder will touch the metal below, you will propably burn down the main cpu. You can eassly push it below the board without dissasembling it
![IMG_20220707_234053](https://user-images.githubusercontent.com/53944559/183510614-dddab2b1-51b0-42ae-a84b-d555c46c2ae4.jpg)

then solder some pogo pins to it, at arround 30 degrees. Make the connection solid. Be carefull to not damage the main plastic body of the device as I did.
![IMG_20220808_190308](https://user-images.githubusercontent.com/53944559/183511161-bf3e6641-483c-438c-9df0-30c7312247df.jpg)
i also added some epoxy to make it more solid. Soldering tin is "soft" so if you will connect / disconnect many times, the pins will get loose and break with time.
![IMG_20220808_190740](https://user-images.githubusercontent.com/53944559/183511185-f3669988-ae3a-4138-a3b9-e70fda2fbe8c.jpg)

### external sd card
Tired of opening the device? buy something like this:
https://kamami.pl/przewody/581548-elastyczny-przedluzacz-do-karty-microsd-25cm.html?search_query=przedluzacz+sd&results=3
![image](https://user-images.githubusercontent.com/53944559/183513457-8c8d30e7-fc32-414f-8f36-1dd53dc22597.png)
unpack the sd slot from the plastic cover, i also suggest replacing the tape with a pack of cables as showed below. Also capton tape everything near to the sd card slot. While inserting, there is one capacitor that could be a problem. Be carefull not to tear off him. As you have the capton tape, I suggest placing it everywhere. Near the battery connector too.

The result should be something like this ( Use a bit of hot glue to glue it together )

![IMG_20220720_143839](https://user-images.githubusercontent.com/53944559/183515187-0a152b19-d3f9-400f-988c-c6a05b9a441b.jpg)

The extension cable should work, if not, clean the pads of the extension cable with some alcohol, disconnect the sd card and connect it once more

After installing, linux kernel will report `card claims to support voltages below defined range` Thats propably because there is a diode and a resistor on the sd slot pcb board.

### finishing

Insert round 2x10 magnets to the main case ( use a bit of hot glue too... )
![IMG_20220808_191115](https://user-images.githubusercontent.com/53944559/183515841-99a24cb3-faec-40b6-9ccc-715de481dd18.jpg)

I suggest printing the "plugs" to cover the sd card and serial with TPU. Easier to insert, it fits better

The final look ( On my prototype, not really good looking 3D print ):

![IMG_20220808_232108](https://user-images.githubusercontent.com/53944559/183517382-d9cb34de-eba5-499d-a4bb-7a9462a165bd.jpg)

![IMG_20220808_232116](https://user-images.githubusercontent.com/53944559/183517609-39ebddab-6271-4e24-ae16-a959280fed29.jpg)

## Extension - front case + stand
Kindle like cover - connected via magnets to the main body

![IMG_20220808_233027](https://user-images.githubusercontent.com/53944559/183518686-6fa13ba7-3c6a-46c7-8800-92647288a760.jpg)

![IMG_20220808_233206](https://user-images.githubusercontent.com/53944559/183518713-850e795e-75ca-4515-8cc5-b6de101b2868.jpg)

![IMG_20220808_233229](https://user-images.githubusercontent.com/53944559/183518726-24639418-0c8f-4ef5-becc-7684aa1417ba.jpg)

![IMG_20220808_233249](https://user-images.githubusercontent.com/53944559/183518734-8a16d921-3acf-4d39-8c95-3f49ac37bb60.jpg)

### How to print?

Pause the print and insert the TPU part, glue it with "quick glue", and resume the print. Depending of your TPU, the parts thickness will differ, so you need to experiment with it

### Notes:
- I didn't figured out yet how to prevent the cover from falling off the front
- The hal sensor is activated even if the case is on the back. So I implemented a "Custom case option" in inkbox OS new power daemon
