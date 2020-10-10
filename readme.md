# GregTech5-unofficial Visualizer

Ever want to play with some of the components in some of the more complex mechanics of the game without blowing up your base? Then have we got a tool for you.

## Installation
Go over to the releases and download one of the binaries and the `.pck` file. The binary will not update frequently, so you likely will not have to download it again

## Features

### Larger Turbine generator calculations (Steam, Super Heated Steam, Gas and Plasma)
Will tell you the optimal fuel rate, eu output, and stats for the selected turbine size, fuel and flow rate.

* Provides a quick way to see what materials you might have available (by tier).
* Quick changing of turbine size, generator type, fuel, and flow rate.
* Most turbine materials enumerated (I might have missed some, and I left off some crappy options).
* Most most gas fuels enumerated (I probably missed a few if they where not on the materials enum).
* A few of the plasma fuels enumerated (I haven't transcribed them all).

## Todo

* [ ] refactor the materials and fuels arrays to load from json files
* [ ] finish adding the plasma fuels
* [ ] Add a panel to edit the stored data files.
* [ ] Actually use a table interface so the data can be sorted effectively
