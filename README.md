To fix FT_DEVICE_NOT_OPENED error on Linux:
````
sudo rmmod ftdi_sio  
sudo rmmod usbserial
````

On Mac:
````
sudo kextunload -b com.apple.driver.AppleUSBFTDI
````
