extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dataControl = find_node("TurbineUsage")
	var InfoControl = find_node("InfoPannel")
	dataControl.connect("update", InfoControl, "receive_update")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
