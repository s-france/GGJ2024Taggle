class_name p2Controller
extends Node2D


var jump : bool = false
var L : bool = false
var R : bool = false

@export var p0 : Player2
@export var p1 : Player2
@export var p2 : Player2

var PlayerCharacters = [p0, p1, p2]

var currentPlayer : Player2 = p0
var playerIdx : int = 0


var input_direction : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	

func _physics_process(delta):
	L = Input.is_action_just_pressed("switch_to_left")
	R = Input.is_action_just_pressed("switch_to_right")
	
	input_direction = Input.get_vector("left_2", "right_2", "up_2", "down_2")
	
	
func GetInputDirection():
	return input_direction
	

#player = 1 or -1 for right or left
func SwitchPlayers(player: int):
	playerIdx = playerIdx + player
	currentPlayer = PlayerCharacters[playerIdx]
	

