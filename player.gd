extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -600.0
var IS_MOVING = false

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		IS_MOVING = true
		animated_sprite.stop()
	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		IS_MOVING = true
		animated_sprite.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		IS_MOVING = true
		animated_sprite.stop()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		IS_MOVING = false
		animated_sprite.play("idleAnimation")
		
	move_and_slide()
