extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var IS_MOVING = false

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		IS_MOVING = true
		animated_sprite.play("JumpAni")

	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		IS_MOVING = true

	# this is for movement and animations 
	var direction := Input.get_axis("left", "right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
		
	if is_on_floor():
		if direction:
			velocity.x = direction * SPEED
			animated_sprite.play("walkAnimation")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			animated_sprite.play("idleAnimation")
	else:
		velocity.x = direction * SPEED
		animated_sprite.play("JumpAni")
		
	move_and_slide()
