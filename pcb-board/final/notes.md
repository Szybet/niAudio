So many problems... ;/
![IMG_20221204_005209_DRO](https://user-images.githubusercontent.com/53944559/205467556-7858e5ea-265e-494b-af89-5dd6fb2ad69a.jpg)
### Component values that i used that make it work:
![IMG_20221204_005209_DRO-change](https://user-images.githubusercontent.com/53944559/205468611-6f016186-a26d-4ae7-a219-0abe7f9c9db4.jpg)
### Notes (xN):
1. missing ground on the resistor, needed to bridge
2. this circuit doesnt worked at all because mosfets work on voltage diffrences, and they aren't perfect diodes + transistors were rotated incorectly anyway. Now its working that when you connect charger, the circuit turns itself on, its only charging ( which is ironic, explained later )
3. There are 2 packages of this chip, i ordered SOT6 but used SOT5 pinout ( its diffrent for a reason... ) so those 2 red pins need to be lifted, and the bottom one bridged
![PICT0017](https://user-images.githubusercontent.com/53944559/205468911-07e12748-1c93-4f4a-b749-b0d7037b19a2.jpg)


4. this pin needs to be pulled to 3.3V
5. Stupidiest design error - this pin needs to be, after a 1.8k resistor connected to the data line, in 5.1 it is shown, and only "orange" paint makes contact. Here is a better picture:
![PICT0016](https://user-images.githubusercontent.com/53944559/205468906-eb5f1e98-63ff-45b5-94ac-a1a82b1e8845.jpg)

6. To make a good, but without glue connection with the bottom case; goldpins, solder and holes in the part were used. Works good
7. Biggest problem to figure it out to work: host data lines should be pulled to GND with 12k resistors, and peripherals with 10k
![PICT0019](https://user-images.githubusercontent.com/53944559/205469120-a806cb2a-52ca-4601-b9e0-6dea1a973248.jpg)

8. If not THT micro usb ports are used, use some epoxy to make it stronger

Other notes:
- those big yellow things are polimer fuses, 0,5A
- After turning it on, the LED next to the hub will not turn on, the chip didn't even booted up correctly. Its the standby diode, it will be on when the hub will do nothing

Failures:
- Forgot a option to turn on/off the circuit. So the button above turns it on, and to turn it off, connect the charger or just disconnect the battery / connect it. Then it will off and waiting for a charger, button press
- Use SMD usb A ports - it would be smaller
- IC for charging is expensive and hard to solder. IP5328P would be better, cheaper, with more functions
- IC for usb hub is stupid and expensive - requires 3.3V, and only 1.1 USB compatible. FE1.1S Would be better

#### Should have looked at the example schematic a bit more.
