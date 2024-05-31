# RG35XX-SP
Setup and tweaks for the Anbernic SP clone emulator

I'd recently opined for playing some games on the go on a device less clunky than a Steam Deck - re-visiting or finishing things that 

Then I saw that Anbernic released a cute new little SP clone - a clamshell emulator running with retroarch, supporting ROMS up to PSX, essentially. It was reaonably priced, so I decided to grab one.

I've got to say, it is so nice tyo have a clamshell device like that that I can close up and toss in by backpack as I travel:

{image}

One of the things that I felt could be improved was the firmware the device was running with. Anbernic shipped the device with a its stock firmware and a bunch of goodies. I found the firmware a bit clunky - lacking swiftness and a simple and sleek interface. 

I decided to give MuOS a try: https://muos.dev

The following will serve as a guide to installing and tweaking things for MuOS on the RG35XX-SP. It assumes that you are using a PC/laptop running a linux distro (trying to use coreutils as much as possible).

I will add things to this README as I make changes that seem.. interesting enough to document here.

## Downloading the firmware

```
wget https://dl.muos.dev/RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
unzip RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
```

## Writing to a MicroSD card

⚠️ Make sure you are pointing this to the `df -h`, `gnome-disks`, or `gparted` might help you better visualize this better before imaging.

When you aer ready with your path to the MicroSD you have connected to your machine, go ahead and start imaging with the following one-liner:

```
sudo dd if=muOS-RG35XX-2405-BEANS.img of=/dev/sdc status=progress && sync
```

## First bootup on the RG35XX-SP



## Adding games

## Adding and installing themes

## Handling Save States
