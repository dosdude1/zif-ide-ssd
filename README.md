# ZIF IDE SSD

A custom-designed IDE SSD for use in any machine that utilizies a 1.8" ZIF IDE hard disk. 

The design is based on the Silicon Motion SM2236 controller, and is compatible with up to four 512Gbit (64GB) BGA152 or BGA132 NANDs.

## Important Info

WARNING: THE SILICON MOTION SM2236 CONTROLLER PINOUT AND IMPLEMENTATION HAVE BEEN REVERSE ENGINEERED FROM OPEN DOCUMENTS AND SALVAGED PCBS, ALL OF WHICH HAVE BEEN LEGALLY OBTAINED. DO NOT EXPECT THIS TO BE CORRECT, CHECK FOR YOURSELF.

### NAND Info

- The NAND ICs used on this PCB must be explicitly supported by the SM2236 controller. All supported NAND ICs are listed in the SM2236 MPTool, or "Mass Production Tool". Be sure to verify compatibility before installing NANDs.

- All installed NAND ICs must match.

- Check the datasheet for your desired NAND ICs to determine their rated I/O voltage, and populate the correct resistor position on the board to set either 3.3V or 1.8V. This is shown in the schematic diagram.

## Programming

Upon the completion of board assembly, the SM2236 controller must be programmed for the NAND ICs you have installed. To do so, you must utilize an IDE to USB adapter to connect the drive to a PC running Windows (using native IDE for this will not work). Then, the SM2236 MPTool must be used to set all the desired drive information, select the part number of NAND ICs you have installed, and program the drive.

## 3D Printed Case

In the `Case` directory you will find an OpenSCAD file to produce a case for the SSD. This has been tuned to prusaslicer with:

- PETG filament

- Monotonic solid infill

- 0.35mm layer height

- 3 perimiters

It has not been printed under any other conditions. Because the case is only 8 layers thick it is very susceptible to poor bed adhesion and warping. 