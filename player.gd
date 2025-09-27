extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var IS_MOVING = false
var flower_enter_1 = false
var FLOWER_DONE = false

@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_flower = $"../FlowerSprite"
func _ready() -> void:
	animated_flower.play("dead")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		IS_MOVING = true
		animated_sprite.play("JumpAni")
	
	if Input.is_action_just_pressed("interact") and flower_enter_1:
		# player change animaion
		animated_sprite.play("personWithFlower")
		# change flower to blooming
		animated_flower.play("alive")
		FLOWER_DONE = true

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


func _flower_enter(body: Node2D) -> void:
	flower_enter_1 = true


func _on_finalgame_body_entered(body: Node2D) -> void:
	if FLOWER_DONE is true:
	
