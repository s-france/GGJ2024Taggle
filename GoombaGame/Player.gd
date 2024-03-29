extends CharacterBody2D

@export var dSound : deathSound

var speed = 2200.0
const friction = 5000.0
const accel = 5.0

var hitPlayer : bool = false
@onready var timer = $"../Timer"
var col_amount = 0

func _physics_process(delta):
	
	var input_direction = Input.get_vector("left_1", "right_1", "up_1", "down_1")
	
	player_movement(input_direction, delta)
	move_and_slide()
	
	
	

func player_movement(input, delta):
	if input == Vector2.ZERO:
		if velocity.length() > (friction*delta):
			velocity -= velocity.normalized() * friction * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (((speed*input) - velocity) * accel * delta)
		
		
		velocity.limit_length(speed)

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
		if collision.get_collider() is Player2:
			
			if !hitPlayer:
				hitPlayer = true
				
				print("colliding with player")
				print(col_amount)
				
				col_amount += 1
				
				if col_amount == 2 && speed < 2500:
					speed = 2650
					if timer.time_left > 15.0:
						timer.start(15.0)
				
				if col_amount == 3:
					get_tree().change_scene_to_file("res://p1wins.tscn")
					
				KillPlayer(collision, collision.get_collider())
			
	hitPlayer = false
			
func KillPlayer(collision, player: Player2):
	player.control.PlayersAlive[player.idx] = 0
	player.control.SwitchPlayers(1)
	
	dSound.playing = true
	
	collision.get_collider().queue_free()
