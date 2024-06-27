extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	#flips sprite when moving left or right
	var sprite_2d = $Sprite2D
	if direction > 0: 
		sprite_2d.flip_h = false 
	elif direction < 0: 
		sprite_2d.flip_h = true




#Teleport script


var teleport_distance = 50

func _input(event):
	if event.is_action_pressed("Teleport"):
		teleport_forward()
	if event.is_action_pressed("Left") and event.is_action_pressed("Teleport"):
		teleport_backwards()

func teleport_forward():
	# Calculate the forward direction based on the player's rotation
	var forward_direction = Vector2(cos(rotation), sin(rotation))
	# Calculate the new position
	var new_position = global_position + forward_direction * teleport_distance
	# Set the player's position to the new position
	global_position = new_position

func teleport_backwards():
	# Calculate the backward direction based on the player's rotation
	var backwards_direction = -Vector2(cos(rotation), sin(rotation))
	# Calculate the new position
	var new_position = global_position - backwards_direction - teleport_distance
	# Set the player's position to the new position
	global_position = new_position
