extends Control


# Data elements we use to have fun with
var tier
var turbine
var fuel
var metal
var amount
var consumption
var debug = false

# Control elements to shortcut finding them later
var warningLabel
var displayLabel

func _ready():
	warningLabel = find_node("warningLabel")
	displayLabel = find_node("displayLabel")

func receive_update(attribute, value):
	print("received %s -> %s" % [attribute, value])
	self.set(attribute, value)
	update()

func update():
	update_warning()
	update_display()

func update_warning():
	var text = ""
	
	if not metal:
		text += "\nPlease pick a primary material"
	if not fuel:
		text += "\nPlease specify a fuel"
	if not amount:
		text += "\nPlease specify a fuel amount, or EU generated is 0"
	
	if consumption:
		var effective = consumption["consumed"] - consumption["optimal"]
		if effective != 0:
			text +="\nYou are consuming more fuel than flow (%d) by %dL. \nFind a larger turbine, or reduce fluid input. (This overage is not converted to energy)" % [consumption["optimal"], effective]
	
	if text:
		text = "WARNING: \n" + text

	warningLabel.text = text

func update_display():
	var text = ""
	var effective

	if metal:
		text += "\nMetal: %s" % metal["name"]
		text += "\nDurability: %s" % metal["durability"]
		text += "\nEfficiency: %d" % metal["efficiency"]
		text += "\nFlow: %s" % metal["flow"]
		if debug:
			text += "\n\n%s\n" % metal
	
	if fuel:
		text += "\nFuel: %s" % fuel["name"]
		text += "\nFuel Value per L: %0.2f" % fuel["burnvalue"]


	if consumption:
		text += "\nConsumption Stats"
		text += "\nFuel Consumed: %d" % consumption["consumed"]
		text += "\nGenerator efficiency: %d %%" % consumption["efficiency"]
		text += "\nEnergy Output: %d EU/t" % consumption["eut"]
		text += "\nOptimal Flow: %d" % consumption["optimal"]
		if consumption["consumed"] != consumption["optimal"]:
			effective = consumption["consumed"] - consumption["optimal"]
			text += "\nWARNING: You're missing out on energy: %dL" % effective
			if effective < 0:
				text += "\nYou should increase your flow, you are penalized for not reaching optimal"
			else:
				text += "\nYou should decrease your flow, 25% over 100% is just voided"
		if debug:
			text += "\n%s\n" % consumption
	
	displayLabel.text = text
