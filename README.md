# RG35XX-SP
Setup and tweaks for the Anbernic SP clone emulator

I've recently opined for playing some games on the go on a device less clunky than a Steam Deck - re-visiting or finishing things that I never finished. Maybe I'm getting old..

Anyways, I saw that Anbernic released a cute new little SP clone - a clamshell emulator running with retroarch, supporting ROMS up to PSX, essentially. It was reaonably priced, so I decided to grab one.

I've got to say, it is so nice tyo have a clamshell device like that that I can close up and toss in by backpack as I travel:

![open](/IMG/open_dithered.png)
![shut](/IMG/closed_dithered.png)

One of the things that I felt could be improved was the firmware the device was running with. Anbernic shipped the device with a its stock firmware and a bunch of goodies. I found the firmware a bit clunky - lacking swiftness and a simple and sleek interface. 

I decided to give MuOS a try: https://muos.dev

The following will serve as a guide to installing and tweaking things for MuOS on the RG35XX-SP. It assumes that you are using a PC/laptop running a linux distro (trying to use coreutils as much as possible).

I will add things to this README as I make changes that seem.. interesting enough to document here.

## Downloading the firmware

Lateste version of the firmware can be grabbed from https://muos.dev/release/plush. As of writing this, there is no dedicated firmware for the XX-SP, so it is using the same firmware based on the RG35XX Plus and H. I have tested these to work just fine with the SP model I am using.

Let's just do this in terminal:

```
wget https://dl.muos.dev/RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
```
```
unzip RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
```

## Writing to a MicroSD card

Cool, its downloaded and extracted now.

Dust off a decent MicroSD card from your bin of tangled cables and whatnot. I recommend a 64GB size. 

⚠️ Make sure you are pointing this to the `df -h`, `gnome-disks`, or `gparted` might help you better visualize this better before imaging.

When you are ready with your path to the MicroSD you have connected to your machine, go ahead and start imaging with the following one-liner:

```
sudo dd if=muOS-RG35XX-2405-BEANS.img of=/dev/sdc status=progress && sync
```

Once this is finished, we can eject the card and load it back into the `TF1/INT1` slot at the bottom of the XX-SP.

## First bootup on the RG35XX-SP

Hold the power button down until you see the green light on the side appear.

The splash screen with the MuOS logo will appear. Let's not go flaialing around with the d-pad or any buttons yet now, let the device do its thing setting up the system - you will see a lot of `Factory Reset` messages, but don't worry - it will keep you up to date with the process, even giving you sill quotes along the way.

After 5-10 minutes this process should complete and you will be brought to dashboard. Go ahead and hold the power button for a few seconds to turn the device off and take the MicroSD card out of the XX-SP and back into your linux machine.

## Shortkeys

As a 'back-pocket': These are all the stock shortkeys for muOS, which I find super helpful to memorize:

| Type      | Control |
| --------- | --------|
| Brightness  | MENU + VOLUME|
| Screenshot  | L2 + R2 |
| Sleep Suspend  | HOLD PWR (2 SEC) |
| (Re)Select Core  | Press SELECT on content |
| Content Root | Cell 2, Row 1 |
| RetroArch Menu | MENU + X |
| RetroArch Close Content | START + SELECT |
| Fast Forward Toggle  | MENU + R1 |
| Load State | MENU + R2 |
| Save State | MENU + L2 |
| Slow Motion | MENU + L1 |


It might even be a good idea to just clone this repo and save these, or save this image to your XX-SP to view in case you need it (but maybe not worth it):

![image](https://github.com/RooneyMcNibNug/RG35XX-SP/assets/17930955/dbfd7345-5653-495f-8f9a-071cebf019e5)

## Adding BIOS files

muOS seems to install some popular/less-legally-concewrning BIOS files for emulating gaming systems. For any other BIOS files you want, you'll have to fin them on the internet and simply add them to the following path on the MicroSD:

`../ROMS/MUOS/bios`

## Adding games

⚠️ The firmware uses an `exfat` type partition to retain the files - so depending on thedistro you are running with you might need to download the `exfat-utils` package with your [package manager](https://pkgs.org/search/?q=exfat-utils).

Your MicroSD should auto-mount on most systems, and when you open up the removable media in the file viewer you have installed, you should see some folder:

`../ROMS/`: top-level folder where the ROMS and BIOS live

All subfolders of that directory can be created based on the system, so things like:

- `../ROMS/SNES/`
- `../ROMS/NES/`
- `../ROMS/GAMEGEAR/`

You can place your roms in the appropriate folders from there, and muOS will do a good job of picking them up and finding the appropriate emulator to run them with. 

## Adding and installing themes

You can easily install and switch themes for the system. 

These are bundled and compressed in `.zip` files. When you download these you can just move them into the `../ROMS/ARCHIVE/` directory of the MicroSD card you have muOS installed on.

From the device you can install these by going to ** Apps > Archive Manager > {select the `.zip` you want} > A BUTTON **

And to checnge the theme from the device: ** Config > Theme Picker > {select the theme} > A BUTTON **

There are lots of cordsourced themes - unfortunately, some of them are showcased on a discord server (_sigh_)

Here are direct links for a couple I really like:

- https://github.com/vacarotti/muOS_GamePal_Theme/releases/tag/Theme
- https://www.patreon.com/posts/pop-theme-only-104940129

## Handling Save States

After some hours of gaming, i found the shorkeys were pretty bad for handling Save States, and I just started using **`MENU + X` > Save State/Load State** to manage this type of thing via RetroArch. I found this a much more pleasant experience.

## Have at it!

This device is great. I recommend [picking one up](https://anbernic.com/products/rg35xxsp) if you have the means. muOS really does make a difference so far, and I think the experience is mush more polished this way.

![organ music blasting](/IMG/ffvi_demo.gif)
