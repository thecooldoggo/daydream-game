extends AnimatedSprite2D
@onready var anim = $AnimationPlayer
if Input.is_action_pressed("left"):
	AnimatedSprite2D.play("animated_spirte_2d.gd")
