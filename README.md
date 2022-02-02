<div align="center">
<h1>Fastboot Fix for AMD Processors</h1>
<strong><i>A bloat-less script to hack registry keys to detect xiaomi devices under fastboot mode on notorious AMD Processors.</i></strong>
<br>
<br>
</div>

AMD Processors can't handle fastboot mode on Android devices having qualcomm chipset especially, on Xiaomi devices. This batch script will add certain registry keys to workaround with that problem (until AMD and Xiaomi roll out official patches for the drivers).

>I am not the one who discover this fix. An unknown developer from the great **Custom Rom** community is the one behind this magic. I had just automate this process for *newbies.*

### Usage
- Downlaod the batch script from the release tab or clone this repo.
- Right click the batch script and click on `Run As Administrator` to start the script
- Press `[Enter]` to start patching registry keys... 

Additionally, you can pass `--skip-backup` flag to bypass registry backup process.
- Open Terminal/cmd on the same directory (Type `cmd` on the address bar of the file explorer)
- Execute `.\AMD_Processor-Fastboot.Fix.bat --skip-backup` to run script without backing up Reg keys.

## What it fixes?
- Fastboot.exe: `???????????????` on connected device list.\
  ~ In some cases, this happens on executing `fastboot devices` command second time.

- "Press any key to shutdown" showing at the top-left corner of the screen while in fastboot mode.
- Mi Unlock tool: Device not connected!
- Fastboot.exe: Failed to download errors
- Fastboot.exe: Waiting for the device...

Literally, Anything related to fastboot.

## Share & Star
If this script works for you then spare some seconds to share this to the needy and give it a star 🌟to make this reachable to other people...
