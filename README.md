# keyboardio-model01-tenting-stand
The 3D model for the tenting stand I use with my [Keyboardio Model 01](https://keyboard.io) keyboard.

I've printed the models in 1.75mm ABS on both a [FlashForge Creator Pro](http://www.flashforge.com/creator-pro-3d-printer/) and a [MakerBot Replicator 2X](https://pages.makerbot.com/ap-replicator-2x.html). 30% hexagonal infill is sufficiently stable (I haven't tested with less).

**WARNING: To avoid wear on your keyboard, you MUST use some sort of pad/bumper between the stand/keyboard and your desk!**. Using these models, part of the weight of the keyboard rests on one of its wooden edges; this is by design, as it forces a consistent angle between the stand and keyboard. However, you risk chipping the contact point on the keyboard unless you put some sort of padding there! I found that some felt stick-on furniture pads I had lying around worked well for this (I'm using [these SoftTouch brand ones](https://www.amazon.com/dp/B000SL4GEM/ref=cm_sw_em_r_mt_dp_U_9tJCCbQ0N5YCF)).

# Usage
Unlike the original models this was based on, mine is not vertically symmetrical, so you must produce 2 different (mirrored) models to print the left and right stands. Use the `build_for_left_keyboard_half` variable at the top of the model source to switch which half you're rendering a model for.

You'll need to use [OpenSCAD](http://www.openscad.org/) to generate files usable by your printer from the source `model.scad` file.

You can use `build.ps1` to generate .stl files for the left and right halves to the `/out/` directory (it assumes you're using Windows with OpenSCAD installed to the default location).

# Licensing
Source licensed under MIT, resulting models licensed under [CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/).

Based on [CC-BY 3.0](https://creativecommons.org/licenses/by/3.0/) [original](https://www.thingiverse.com/thing:2803754) [designs](https://www.thingiverse.com/thing:3047870) by Thingiverse users [fluffy](https://www.thingiverse.com/fluffy/about) and [deivid__](https://www.thingiverse.com/deivid__/about).
