extends Control

signal update

const TIERS = [
	{"name": "HV", "value": 3},
	{"name": "EV", "value": 4},
	{"name": "IV", "value": 5},
	{"name": "Fusion", "value": 9},
]

const SIZES = [
	{"name": "Small", "shaft": "Magnalium", "tier_value": 2},
	{"name": "Normal", "shaft": "Titanium", "tier_value": 3},
	{"name": "Large", "shaft": "Tungsten Steel", "tier_value": 4},
	{"name": "Huge", "shaft": "Americium", "tier_value": 9},
]

const GENERATORS = [
		{"name": "Steam", "generator": 11},
		{"name": "Super Heated Steam", "generator": 12},
		{"name": "Bear Farts", "generator": 1},
		{"name": "Plasma", "generator": 4},
		{"name": "Diesol", "disabled": true, "generator": 0},
		{"name": "Thermals keep you warm", "disabled": true, "generator": 2},
		{"name": "Margics", "disabled": true, "generator": 5},
		{"name": "Sludge", "disabled": true, "generator": 3},
	]
var fuels = [
	{"name": "Steam", "burnvalue": 0.5, "generator": 11},
	{"name": "Super Heated Steam", "burnvalue": 1, "generator": 12},
	{"name": "Biogas", "burnvalue": 32, "generator": 1},
	{"name": "Wood Gas", "burnvalue": 24, "generator": 1},
	{"name": "Methane", "burnvalue": 104, "generator": 1},
	{"name": "Hydrogen", "burnvalue": 20, "generator": 1},
	{"name": "Natural Gas", "burnvalue": 15, "generator": 1},
	{"name": "Sulfuric Gas", "burnvalue": 20, "generator": 1},
	{"name": "Refinery Gas", "burnvalue": 128, "generator": 1},
	{"name": "Sulfuric Naptha", "burnvalue": 32, "generator": 1},
	{"name": "Naptha", "burnvalue": 256, "generator": 1},
	{"name": "LPG", "burnvalue": 256, "generator": 1},
	{"name": "Ethane", "burnvalue": 168, "generator": 1},
	{"name": "Propane", "burnvalue": 232, "generator": 1},
	{"name": "Butane", "burnvalue": 296, "generator": 1},
	{"name": "Toluene", "burnvalue": 328, "generator": 1},
	{"name": "Carbon Monoxide", "burnvalue": 24, "generator": 1},
	{"name": "Benzene", "burnvalue": 288, "generator": 1},
	{"name": "Phenol", "burnvalue": 288, "generator": 1},
	{"name": "Boron Plasma", "burnvalue": 10240, "generator": 4},
	{"name": "Sulfuric Plasma", "burnvalue": 32768, "generator": 4},
	{"name": "Radon Plasma", "burnvalue": 225280, "generator": 4},
]

var metals = [{'name': 'adamantium', 'speed': 10, 'quality': 5, 'damage': 5120}, {'name': 'aluminium', 'speed': 10, 'quality': 2, 'damage': 128}, {'name': 'beryllium', 'speed': 14, 'quality': 2, 'damage': 64}, {'name': 'bismuth', 'speed': 6, 'quality': 1, 'damage': 64}, {'name': 'bismuth_bronze', 'speed': 8, 'quality': 2, 'damage': 256}, {'name': 'black_steel', 'speed': 6.5, 'quality': 2, 'damage': 256}, {'name': 'blueSteel', 'speed': 7.5, 'quality': 2, 'damage': 1024}, {'name': 'brass', 'speed': 7, 'quality': 1, 'damage': 96}, {'name': 'bronze', 'speed': 6, 'quality': 2, 'damage': 192}, {'name': 'chrome', 'speed': 11, 'quality': 3, 'damage': 256}, {'name': 'cobalt', 'speed': 8.0, 'quality': 3, 'damage': 512}, {'name': 'damascus_steel', 'speed': 8, 'quality': 2, 'damage': 1280}, {'name': 'dark_steel', 'speed': 8.0, 'quality': 3, 'damage': 512}, {'name': 'desh', 'speed': 1, 'quality': 3, 'damage': 1280}, {'name': 'duranium', 'speed': 16, 'quality': 5, 'damage': 5120}, {'name': 'enriched_naquadah', 'speed': 6, 'quality': 4, 'damage': 1280}, {'name': 'fireySteel', 'speed': 8, 'quality': 3, 'damage': 256}, {'name': 'gold', 'speed': 12, 'quality': 2, 'damage': 64}, {'name': 'HSS-E', 'speed': 10, 'quality': 4, 'damage': 5120}, {'name': 'HSS-G', 'speed': 10, 'quality': 3, 'damage': 4000}, {'name': 'HSS-S', 'speed': 14, 'quality': 4, 'damage': 3000}, {'name': 'invar', 'speed': 6, 'quality': 2, 'damage': 256}, {'name': 'iridium', 'speed': 6, 'quality': 3, 'damage': 2560}, {'name': 'iron', 'speed': 6, 'quality': 2, 'damage': 256}, {'name': 'ironwood', 'speed': 6, 'quality': 2, 'damage': 384}, {'name': 'knightmetal', 'speed': 8, 'quality': 3, 'damage': 1024}, {'name': 'magnalium', 'speed': 6, 'quality': 2, 'damage': 256}, {'name': 'magnetic_iron', 'speed': 6, 'quality': 2, 'damage': 384}, {'name': 'magnetic_steel', 'speed': 6, 'quality': 2, 'damage': 768}, {'name': 'manganese', 'speed': 7, 'quality': 2, 'damage': 512}, {'name': 'molybdenum', 'speed': 7, 'quality': 2, 'damage': 512}, {'name': 'naquadah', 'speed': 6, 'quality': 4, 'damage': 1280}, {'name': 'naquadah_alloy', 'speed': 8, 'quality': 5, 'damage': 5120}, {'name': 'naquadaria', 'speed': 1, 'quality': 4, 'damage': 512}, {'name': 'neodymium', 'speed': 7, 'quality': 2, 'damage': 512}, {'name': 'netronium', 'speed': 24, 'quality': 6, 'damage': 655360}, {'name': 'nickel', 'speed': 6, 'quality': 2, 'damage': 64}, {'name': 'osmiridium', 'speed': 7, 'quality': 3, 'damage': 1600}, {'name': 'osmium', 'speed': 16.0, 'quality': 4, 'damage': 1280}, {'name': 'palladium', 'speed': 8, 'quality': 2, 'damage': 512}, {'name': 'pig_iron', 'speed': 6, 'quality': 2, 'damage': 384}, {'name': 'platinum', 'speed': 12, 'quality': 2, 'damage': 64}, {'name': 'plotonium_241', 'speed': 6, 'quality': 3, 'damage': 512}, {'name': 'plotonium_244', 'speed': 6, 'quality': 3, 'damage': 512}, {'name': 'silver', 'speed': 10, 'quality': 2, 'damage': 64}, {'name': 'stainless_steel', 'speed': 7, 'quality': 2, 'damage': 480}, {'name': 'steel', 'speed': 6, 'quality': 2, 'damage': 512}, {'name': 'throium', 'speed': 6, 'quality': 2, 'damage': 512}, {'name': 'tin_alloy', 'speed': 6.5, 'quality': 2, 'damage': 96}, {'name': 'titanium', 'speed': 7, 'quality': 3, 'damage': 1600}, {'name': 'tritanium', 'speed': 20, 'quality': 6, 'damage': 10240}, {'name': 'tungsten', 'speed': 7, 'quality': 3, 'damage': 2560}, {'name': 'tungstencarbide', 'speed': 14, 'quality': 4, 'damage': 1280}, {'name': 'tungstensteel', 'speed': 8, 'quality': 4, 'damage': 2560}, {'name': 'ultimet', 'speed': 9, 'quality': 4, 'damage': 2048}, {'name': 'uranium_235', 'speed': 6, 'quality': 3, 'damage': 512}, {'name': 'uranium_238', 'speed': 6, 'quality': 3, 'damage': 512}, {'name': 'vanadiumsteel', 'speed': 3, 'quality': 3, 'damage': 1920}, {'name': 'wrought_iron', 'speed': 6, 'quality': 2, 'damage': 384}]

# Control values
var tier = 3 setget _set_tier # Seed UI Default
var turbine = "Small" setget _set_turbine # Seed UI default
var fuel = {} setget _set_fuel
var metal = {} setget _set_metal
var amount = 0 setget _set_amount
var consumption = {} setget _set_consumption

# Control shortcuts, will be populated by _ready()
var tierControl
var turbineSizeControl
var infoSizeLabel
var generatorTypeControl
var fuelControl
var qtyOnHandControl
var itemListControl

func _ready():
	tierControl = find_node("tierControl")
	turbineSizeControl = find_node("turbineSizeControl")
	infoSizeLabel = find_node("infoSizeLabel")
	generatorTypeControl = find_node("generatorTypeControl")
	fuelControl = find_node("fuelControl")
	qtyOnHandControl = find_node("qtyOnHandControl")
	itemListControl = find_node("itemListControl")
	
	assign_dict_list_drop_down(tierControl, TIERS)
	assign_dict_list_drop_down(turbineSizeControl, SIZES)
	assign_dict_list_drop_down(generatorTypeControl, GENERATORS)
	update_metals_list()
	

func send_update(attribute, value):
	print("update %s: %s" % [attribute, value])
	call_deferred("emit_signal", "update", attribute, value)
	#emit_signal("update", attribute, value)
	
func _set_tier(value):
	tier = value
	send_update("tier", value)

func _set_turbine(value):
	turbine = value
	send_update("turbine", value)
	
func _set_fuel(value):
	fuel = value
	update_consumption()
	send_update("fuel", value)

func _set_metal(value):
	metal = value
	update_consumption()
	send_update("metal", value)

func _set_amount(value):
	amount = value
	update_consumption()
	send_update("amount", value)

func _set_consumption(value):
	consumption = value
	send_update("consumption", value)

func assign_list_drop_down(element, values):
	element.clear()
	for item in values:
		element.add_item(item)

	# Send the selected signal since the list changed
	element.emit_signal("item_selected", element.get_selected())

func assign_dict_list_drop_down(element, values, key="name"):
	element.clear()
	for array in values:
		element.add_item(array[key])
		if array.get("disabled"):
			var position = element.get_item_count() - 1
			element.set_item_disabled(position, array.get("disabled"))
	
	# Send the selected signal since the list changed
	var selected
	if element.get_class() == "ItemList":
		selected = element.get_selected_items()
	else:
		selected = element.get_selected()
	element.emit_signal("item_selected", selected)
	
	# Disable the control if there is only one value
	element.disabled = true if element.get_item_count() == 1 else false

func filter_dict_list(list, aspect, value):
	var result = []
	for item in list:
		if item.get(aspect) == value:
			result.append(item)
	return result

func translate_turbine_size(item, size="normal"):
	var speedMultiplier
	var durabilityMultiplier
	var baseDamage
	
	match size:
		"Small":
			speedMultiplier = 1.0
			durabilityMultiplier = 1.0
			baseDamage = 0.0

		"Normal":
			speedMultiplier = 2.0
			durabilityMultiplier = 2.0
			baseDamage = 2.5

		"Large":
			speedMultiplier = 3.0
			durabilityMultiplier = 3.0
			baseDamage = 5.0

		"Huge":
			speedMultiplier = 4.0
			durabilityMultiplier = 4.0
			baseDamage = 3.0

	item["combatDamage"] = item["quality"] + baseDamage
	item["speedMultiplier"] = speedMultiplier
	item["durabilityMuliplier"] = durabilityMultiplier
	item["baseDamage"] = baseDamage

	item["durability"] = 100 * item["damage"] * durabilityMultiplier
	item["efficiency"] = 50 + (10.0 * item["combatDamage"])
	
	# Gas flow is actually the default, and everything else is reference
	item["flow"] = speedMultiplier * item["speed"] * 50
	item["steamFlow"] = item["flow"] * 20 # Tooltip reference was speedMul * speed * 1000
	item["plasmaFlow"] = item["flow"] * 40 # Tooltip reference was speedMul * speed * 2000

	# To calc ETt for Steam
	# fluidIntoPower("steam", amount, optFlow = item["flow"], baseEff = item["efficiency"] * 100

func getFuelValue(item):
	return item["burnvalue"]

func getFuelType(item):
	match item["generator"]:
		12: return "shs"   # Not from GT5u, we made it up
		11: return "steam" # Not from GT5u, we made it up
		5: return "magic"
		4: return "plasma"
		2: return "thermal"
		1: return "gas"
		0: return "solid"
		# Technially 3, but if its undefined, use this one as default
		_: return "semifluid"

func calculate_consumption(fuel, amount, optimalFlow, baseEff):
	# Fuel is the fuel selected
	# amount is the amount of fuel you have available
	# optimalFlow is the flow value from the rotor
	# baseEff is the efficiency of the rotor * 100
	
	# Returns a dict of:
	#  eut			the amount of energy produced a tick
	#  remaining	the amount of fuel remaining after consumption is complete (125% rule)
	#  optimal 		the amount of fuel that is optimal per tick

	var actualOptFlow = 0
	var amountRemaining = amount
	var eff
	var flow = 0
	var fuelValue = getFuelValue(fuel)
	var totalEU = 0

	match getFuelType(fuel):

		# Plasma is potent
		"plasma":
			optimalFlow *= 40
			actualOptFlow = int((optimalFlow + fuelValue -1 ) / fuelValue)

		# Steam is boring
		"steam":
			actualOptFlow = optimalFlow

		# Everyone else normalizes for fuel value
		"gas", "shs":
			actualOptFlow = int(optimalFlow / fuelValue)

	# For some reason, we're allowed to, and do consume upto 125% of the input hatch,
	# and for some reason, that 25% isn't used, its just gone.
	# Hello Darkness my old friend...
	flow = int(min(amount, actualOptFlow * 1.25))
	amountRemaining -= flow

	totalEU = int(min(actualOptFlow, flow) * fuelValue)

	eff = max(0, min(1.0, (1.0 + (flow - actualOptFlow) / actualOptFlow)))
	totalEU = max(1, int(totalEU * eff * baseEff / 10000 ))
	
	return {"eut": totalEU, "remaining": amountRemaining, "optimal": actualOptFlow, "efficiency": eff * 100, "consumed": flow}

func update_consumption():
	if not amount or not fuel or not metal:
		return
	self.consumption = calculate_consumption(fuel, amount, metal["flow"], metal["efficiency"] * 100)
	

func update_metals_tier_disabled(list, tier):
	for item in list:
		if item.get("quality") > tier:
			item["disabled"] = true
		else:
			item.erase("disabled")

func update_metals_description(list, turbine):
	# Iterate through the metals list updating the list based on the new infor
	for item in list:
		translate_turbine_size(item, turbine)
		item["description"] = "%s    flow: %d    efficiency %d" % [item["name"], item["flow"], item["efficiency"]]

func update_metals_list():
	# Re-configure the ItemList based on the current metals data
	update_metals_description(metals, turbine)
	update_metals_tier_disabled(metals, tier)
	
	var element = itemListControl
	element.clear()
	for array in metals:
		element.add_item(array["description"])
		if array.get("disabled"):
			var position = element.get_item_count() - 1
			element.set_item_disabled(position, array.get("disabled"))
	
	# Send the selected signal since the list changed
	var selected = element.get_selected_items()
	if selected:
		element.emit_signal("item_selected", selected[0])
	

func _on_turbineSizeControl_item_selected(index):
	#TODO: SendUpdate
	self.turbine = SIZES[index]["name"]
	infoSizeLabel.text = "Requires a %s shaft" % SIZES[index]["shaft"]

	#Action: Regenerate metals list with values for current turbine size

	update_metals_list()

func _on_generatorTypeControl_item_selected(index):
	# Generator does NOT influence the cauculations, only the fuel, so
	# We do not need to send an update when this changes
	assign_dict_list_drop_down(fuelControl, filter_dict_list(fuels, "generator", GENERATORS[index]["generator"]))

func _on_fuelControl_item_selected(index):
	self.fuel = filter_dict_list(fuels, "name", fuelControl.get_item_text(index))[0]
	#TODO: send update

func _on_qtyOnHandControl_value_changed(value):
	#TODO:  When changing the qty on hand, we should disable materials based on being able to handle flow
	#TODO:  send update
	
	self.amount = value

func _on_tierControl_item_selected(index):
	# When changing the tier, we disable/enable the rotors and materials based
	# on their reachability

	self.tier = TIERS[index]["value"]
	update_metals_list()

func _on_itemListControl_item_selected(index):
	#TODO: send update
	if itemListControl.is_selected(index):
		self.metal = metals[index]
