# RG35XX-SP Setup and Tweaks

I've recently pined for playing some games on the go on a device less clunky than a Steam Deck - re-visiting or finishing things that I never finished. Maybe I'm getting old..

Anyways, I saw that Anbernic released a cute new little SP clone - a clamshell emulator running with retroarch, supporting ROMS up to PSX, essentially. It was reasonably priced (link at bottom), so I decided to grab one.

I've got to say, it is nice to have a clamshell device like this. I can close up and toss in by backpack as I travel:

![open](/IMG/open_dithered.png)
![shut](/IMG/closed_dithered.png)

Using the device, one of the things that I immediately felt could be improved was the firmware the device was running with. It ships with a stock Anbernic firmware and a bunch of goodies. I found the firmware a bit clunky - lacking swiftness, and wanted a more simple and sleek interface.

I decided to give MuOS a try: https://muos.dev

⚠️ Please note that as of writing this, the following functins on the XX-SP do <ins>not</ins> work with muOS:

- Close-lid-to-sleep functionality (although I think this is in the works?)
- Audio output via HDMI (video works fine)
- Bluetooth

These losses are fine for me for now, as I rely on Save States more than I would ever consider the sleep function, but it would be cool to be able to eventually be able to hook this up to a TV and use the other two functions with this custom firmware. Either way, this is a "grab-and-go" pieace of hardware for me for now anyways, so this is all still needs suiting. All of the controls and emulation works great on muOS, and that's what matters.

The following will serve as a guide to installing and tweaking things for MuOS on the RG35XX-SP. It assumes that you are using a PC/laptop running a linux distro (trying to use coreutils as much as possible).

I will add things to this README as I make changes that seem.. interesting enough to document here.

## Downloading the firmware

Latest version of the firmware can be downloaded from https://muos.dev/release/plush. As of writing this, there is no dedicated firmware for the XX-SP, so it is using the same firmware based on the RG35XX Plus and H. I have tested these to work just fine with the SP model I am using.

Let's just do this in terminal:

```
wget https://dl.muos.dev/RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
```
```
unzip RG35XX-PLUSH24/muOS-RG35XX-2405-BEANS.zip
```

## Writing to a MicroSD card

Cool, its downloaded and extracted now.

Dust off a decent MicroSD card from your bin of tangled cables or wherever you keep them. I recommend a 64GB size. 

Plug it into your linux machine.

⚠️<ins>Make sure you are pointing this to the right drive, so that you don't obliterate important data!</ins> `df -h`, `gnome-disks`, or `gparted` might help you better visualize this better before imaging.

When you are ready, go ahead and start imaging with the following one-liner:

```
sudo dd if=muOS-RG35XX-2405-BEANS.img of=/dev/sdc status=progress && sync
```
*`/dev/sdc` should be replaced with your proper drive for the card

Once this is finished, we can eject the card from the machine and load it back into the `TF1/INT1` slot at the bottom of the XX-SP.

## First bootup on the RG35XX-SP

Hold the power button down until you see the green light on the side appears (takes a few seconds).

The splash screen with the muOS logo will appear. Let's not go flailing around with the d-pad or any buttons yet! Let the device do its thing, setting up the system - you will see a lot of `Factory Reset` messages, but don't worry, it will keep you up to date with the process (even providing you with silly quotes along the way).

After 5-10 minutes this process should complete and you will be brought to a dashboard. Go ahead and hold the power button for a few seconds to turn the device off and take the MicroSD card out of the XX-SP and back into your linux machine.

## Shortkeys

Before changing anything else, consider this as a 'back-pocket': These are all the stock shortkeys for muOS, which I find super helpful to memorize:

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


It might even be a good idea to just clone this repo and save these somewhere, or save the following image to your XX-SP to view in case you need it (maybe not worth it):

![image](https://github.com/RooneyMcNibNug/RG35XX-SP/assets/17930955/dbfd7345-5653-495f-8f9a-071cebf019e5)

## Adding BIOS files

muOS seems to install some popular/less-legally-concerning BIOS files for emulating gaming systems. For any other BIOS files you want, you'll have to fin them on the internet and simply add them to the following path on the MicroSD:

`../ROMS/MUOS/bios`

## Adding games

⚠️ The firmware uses an `exfat` type partition to retain the files - so depending on thedistro you are running with you might need to download the `exfat-utils` package with your [package manager](https://pkgs.org/search/?q=exfat-utils).

Your MicroSD should auto-mount on most systems, and when you open up the removable media in the file viewer you have installed, you should see this folder:

`../ROMS/`: top-level folder where the ROMS and BIOS live.

All subfolders of that directory can be created based on the system, so things like:

- `../ROMS/SNES/`
- `../ROMS/NES/`
- `../ROMS/GAMEGEAR/`

You can place your roms in the appropriate folders from there, and muOS will do a good job of picking them up and finding the appropriate emulator to run them with. If you ever run into issues with thise, check the configurations in RetroArch using the proper shorkey mentioned earlier.

## Adding and installing themes

You can easily install and switch themes for the muOS system. 

These are bundled and compressed in `.zip` files. When you download these you usually have to do one of two things:

- Sometimes you can just move the `.zip`s into the `../muos/THEMES/` directory of the MicroSD card you have muOS installed on, no need to extract anything yourself from your linux machine. When you turn the XX-SP on you should just see these in the **Themes** section of the **Config** menu.
- Other times you will need to move them into the `../ROMS/ARCHIVE/` directory of the MicroSD, still no need to extract from your linux machine. Then from the XX-SP you can install these by going to **Apps > Archive Manager > {select the `.zip` you want} > A BUTTON**
- Other times you will need 

Usually on the site hosting the theme the creator will speifcify where these need to go, anyways.

And to change the theme from your XX-SP: **Config > Theme Picker > {select the theme} > A BUTTON**

There are lots of crowd-sourced themes - unfortunately, a lot of them are showcased on a discord server (_sigh_).

Here are direct links for a couple I really like:

- https://github.com/vacarotti/muOS_GamePal_Theme/releases/tag/Theme
- https://www.patreon.com/posts/pop-theme-only-104940129

## Handling Save States

After some hours of gaming, I found the designed shortkeys were pretty bad for handling Save States, and I just started using **`MENU + X` > Save State/Load State** to manage this type of thing via RetroArch. I found this a much more pleasant experience.

## Achievements

It requires wifi to be configured and on, but you can set up Retro Achievements within RetroArch if you have an account at https://retroachievements.org

YOu can do this by going to **Apps > RetroArch > Settings > Achievements** and then put in your login information.

Please note that RA does not seem to cache any progress you make with achievements when you are not connected to wifi or if your connection is severed, so its a bit finnicky in that way.

## Handling with care

I know this is a clamshell and inherently a great way to keep the screen safe from damage, but I can be clumsy sometimes.. I don't want to buy a case really, so I thought about even just getting some decent fabric and sewing it up into a little pouch for the XX-SP. For now, I am using a beer coozie for when I throw this in my backpack. No, I'm not joking. This doubles as a decent layer of protection for the hardware while also keeps my fingers dry if I want to have a can of something while gaming 😄

## Go play some games!

This device is great. I recommend [picking one up](https://anbernic.com/products/rg35xxsp) if you have the means. 

muOS really does make a difference so far. Its feels lightweight in comparison to the stock firmware, and also gets rid of some of the big gripes I have with the defaults on the stock one as well - things like the awful "HD" rendering on by default for games, which makes everything look articifially smoothed out (like spilled milk or something..)

All in all the muOS configurations and gaming itself feels more polished.

![organ music blasting](/IMG/ffvi_demo.gif)
