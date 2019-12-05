extends Spatial

var buildings = {} # List of all the different buildings

var archedTower = preload("res://Scenes/ArchedTower.tscn")
var closedGate = preload("res://Scenes/ClosedGate.tscn")
var fencedEnclosure = preload("res://Scenes/FencedEnclosure.tscn")
var openGate = preload("res://Scenes/OpenGate.tscn")
var shortBlock = preload("res://Scenes/ShortBlock.tscn")
var stairs = preload("res://Scenes/Stairs.tscn")
var tallTower = preload("res://Scenes/TallTower.tscn")
var towerSquare = preload("res://Scenes/TowerSquare.tscn")
var wallWithScaffolding = preload("res://Scenes/WallWithScaffolding.tscn")
var windowedTower = preload("res://Scenes/WindowedTower.tscn")

var building_speed = 10 # How fast the buildings move
var frequency = 2.0 # How many seconds between spawning more buildings
var max_frequency = .5
var time_elapsed = 10 # Time elapsed since last building spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	buildings[archedTower] = true
	buildings[closedGate] = false
	buildings[fencedEnclosure] = true
	buildings[openGate] = true
	buildings[shortBlock] = true
	buildings[stairs] = true
	buildings[tallTower] = false
	buildings[towerSquare] = false
	buildings[wallWithScaffolding] = true
	buildings[windowedTower] = false
	pass # Replace with function body.

func _increase_speed():
	frequency = max(max_frequency, .8 * frequency)

func _process(delta):
	time_elapsed += delta
	# If enough time has elapsed, generate next row of buildings
	if time_elapsed >= frequency:
		# There are a total of 5 possible slots
		var has_gap = false # There has to be at least one gap in each generated row so that the player can use it.
		for current_slot in range(0, 6):
			# 50% chance of spawning a building at that slot unless we are on the last slot and still do not have a gap
			if randi() % 2 == 0 && (current_slot != 5 || has_gap):
				# Choose a random building
				var building = buildings.keys()[randi() % buildings.size()]
				has_gap = buildings[building] # If the building is a 'gap', set has_gap to true
				var building_object = building.instance()
				building_object.transform = transform.translated(Vector3(-30, 0, -7.5 + 2.5 * current_slot))
				add_child(building_object)
			else:
				has_gap = true
		
		time_elapsed = 0
